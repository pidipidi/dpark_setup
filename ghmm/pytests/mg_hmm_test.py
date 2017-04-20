import numpy as np
import sys, os
import ghmm
import ghmmwrapper

sys.path.insert(0, os.path.expanduser('~')+'/catkin_ws/src/hrl-assistive/hrl_anomaly_detection/src/hrl_anomaly_detection/hmm')
import learning_util as util


def f1(t, rnd_mag=0.3):

    x1 = np.cos(t)
    x2 = np.sin(t)

    ts = [0]*10
    te = [t[-1]]*30
    x1 = np.hstack([np.cos(ts), x1, np.cos(te)])
    x2 = np.hstack([np.sin(ts), x2, np.sin(te)])

    x1 += np.random.normal(0,rnd_mag,np.shape(x1))
    x2 += np.random.normal(0,rnd_mag,np.shape(x2))

    return x1, x2

def f2(t, rnd_mag=0.3):

    x1 = np.cos(t)
    x2 = np.sin(t)

    ts = [0]*30
    te = [t[-1]]*10
    x1 = np.hstack([np.cos(ts), x1, np.cos(te)])
    x2 = np.hstack([np.sin(ts), x2, np.sin(te)])

    x1 += np.random.normal(0,rnd_mag,np.shape(x1))
    x2 += np.random.normal(0,rnd_mag,np.shape(x2))

    return x1, x2

#------------------------------------------------------------------------------



t = np.linspace(0.0, np.pi*2.0, 100)
n = 20 

X = []
for i in xrange(n):
    x1,x2 = f1(t, rnd_mag=0.1)
    X.append( np.vstack([ x1.reshape(1,len(x1)), x2.reshape(1,len(x2)) ]) )
X = np.swapaxes(X, 0,1)

nEmissionDim = 2
nState       = 20
F = ghmm.Float()
cov_mult = [0.05]*(nEmissionDim**2)
cov_type = 'full' #'diag'


# Transition probability matrix (Initial transition probability, TODO?)
A = util.init_trans_mat(nState).tolist()
mus, cov = util.vectors_to_mean_cov(X, nState, nEmissionDim, cov_type=cov_type)

# cov: state x dim x dim
for i in xrange(nEmissionDim):
    for j in xrange(nEmissionDim):
        cov[:, i, j] *= cov_mult[nEmissionDim*i + j]
        
# Emission probability matrix
B = [0] * nState
for i in range(nState):
    B[i] = [[mu[i] for mu in mus]]
    B[i].append(cov[i].flatten())

# pi - initial probabilities per state 
pi = [0.0] * nState
pi[0] = 1.0


ml = ghmm.HMMFromMatrices(F, ghmm.MultivariateGaussianDistribution(F), A, B, pi)
print 'Creating Training Data'            
X_train = util.convert_sequence(X) # Training input
X_train = X_train.tolist()
print "training data size: ", np.shape(X_train)

## ml.cmodel.getState(0).setOutProb(1, 0, 0.8)
## print ml.cmodel.getState(0).getOutProb(1)
## print ml.cmodel.getState(0).getOutNum(1)
if cov_type=='diag': ml.setDiagonalCovariance(0)

final_seq = ghmm.SequenceSet(F, X_train)
print 'Run Baum Welch method with (samples, length)', np.shape(X_train)
ret = ml.baumWelch(final_seq, 10000)

######################### save/load params######################################

[out_a_num, vec_num, mat_num, u_denom] = ml.getBaumWelchParams()
ml.setBaumWelchParams(out_a_num, vec_num, mat_num, u_denom)
[out_a_num2, vec_num2, mat_num2, u_denom2] = ml.getBaumWelchParams()

if np.sum(np.array(out_a_num) - np.array(out_a_num2)) + np.sum(np.array(vec_num) - np.array(vec_num2)) + np.sum(np.array(mat_num) - np.array(mat_num2)) + np.sum(np.array(u_denom) - np.array(u_denom2)) != 0.0:
    print "get/set baumwelch param error"
    sys.exit()

[A, B, pi] = ml.asMatrices()
org_mu_list = []
for j in xrange(nState):
    org_mu_list.append( B[j][0] )
org_mu_list = np.array(org_mu_list)

######################### Adaptation ###########################################
# new target traj
X2 = []
n  = 5
for i in xrange(n):
    x1,x2 = f2(t, rnd_mag=0.1)
    X2.append( np.vstack([ x1.reshape(1,len(x1)), x2.reshape(1,len(x2)) ]) )
X2 = np.swapaxes(X2, 0,1)

X_test = util.convert_sequence(X2) # Training input
X_test = X_test.tolist()


import matplotlib.pyplot as plt
mu_list = [[] for i in xrange(nEmissionDim)]
for i in xrange(-1, 20):
    if i >= 0:
        final_seq = ghmm.SequenceSet(F, X_test)    
        #final_seq = ghmm.SequenceSet(F, X_test[i:i+1])    
        ret = ml.baumWelch(final_seq, nrSteps=40, learningRate=0.4)
        print "Ret: ", ret

    m = 10
    seq_list = []
    obs_seq = ml.sample(m, len(x1), seed=3586662)    
    for j in xrange(m):
        seq_list.append(np.array(obs_seq[j]).reshape(len(x1),2).T)
    seq_list = np.swapaxes(seq_list, 0, 1)

    if True:
        import matplotlib.pyplot as plt

        fig = plt.figure()
        
        fig.add_subplot(211)        
        plt.plot(X[0].T, 'b-')
        plt.plot(X2[0].T, 'g-')
        plt.plot(seq_list[0].T, 'r-')
        fig.add_subplot(212)
        plt.plot(X[1].T, 'b-')
        plt.plot(X2[1].T, 'g-')
        plt.plot(seq_list[1].T, 'r-')

        plt.xlabel('Time')
        plt.xlabel('Observation')        
        
        plt.show()


