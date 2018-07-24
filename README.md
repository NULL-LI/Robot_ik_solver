Robot_ik_solver

This is a Matlab-based robot inverse kinematics solver.

This program can give out an equation-chain that can lead to the closed-form symbolic solution of an ik problem.

</br>

Usually the first step will show equaitons that contain only one unknown theta.

On the following steps, the solved thetas will be taken as known to give solutions to other unsolved thetas.

In the end, all the thetas will get solvable.