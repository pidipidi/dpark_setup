import numpy as np
import sys, os
import ghmm
import ghmmwrapper

sys.path.insert(0, os.path.expanduser('~')+'/catkin_ws/src/hrl-assistive/hrl_anomaly_detection/src/hrl_anomaly_detection/hmm')
import learning_util as util



t = np.linspace(0.0, np.pi*2.0, 100)
n = 10 

X = []
for i in xrange(n):
    if i<1:
        x1 = np.cos(t) + np.random.normal(-0.3, 0.3, np.shape(t) )
        x2 = np.sin(t) + np.random.normal(-0.3, 0.3, np.shape(t) )
    else:
        x1 = np.cos(t) + np.random.normal(-0.2, 0.2, np.shape(t) )
        x2 = np.sin(t) + np.random.normal(-0.2, 0.2, np.shape(t) )        
    X.append( np.vstack([ x1.reshape(1,len(t)), x2.reshape(1,len(t)) ]) )
X = np.swapaxes(X, 0,1)


nEmissionDim = 2
nState       = 20
F = ghmm.Float()
cov_mult = [0.05]*(nEmissionDim**2)
cov_type = 'diag'


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
ret = ml.baumWelch(final_seq, 10000, fixedTrans=1)

######################### Test ###########################################
[A_new, B_new, pi_new] = ml.asMatrices()

## print np.array(A) - np.array(A_new)
if np.sum(abs( np.array(A) - np.array(A_new) )) > 0.0:
    print "Failed to fix transition probabilities"
else:
    print "Successed to fix transition probabilities"

