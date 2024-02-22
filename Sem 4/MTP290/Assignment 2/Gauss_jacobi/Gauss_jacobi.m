clc
clear
%A=input('Enter the coefficient matrix A: \n');
A= [64 8 1; 144 12 1;25 5 1 ]; 
% Write the coefficient matrix, A. where  the system: AX=B.
%B=input('Enter the constant matrix B: \n');
B = [177.2; 279.2;106.8]; % Write the constants matrix, B
A = [1 2 3; 2 -1 2; 3 1 -2];
B = [5; 1; -1];
P=[A B]; % constructing the new augmented matrix P 
[row, col] = size(P); % Calculating the size of augmented matrix, P
X=zeros(row,1); % Initial approximation of solutions.
C=zeros(row,1); % A dummy column matrix.
Err=ones(row,1); % Error column matrix.
epsilon=input('\n Enter the tolerance of error '); 
  %error of tolerance you want. for exmple 0.001 or 0.0001 etc.
for m = 1:row % checking strictly diagonally dominant matrix
      if 2*abs(A(m,m))<= sum(abs(A(m,:))) 
         disp('Rearrange the equations to make strictly diagonally dominant matrix!!!'); 
         %Gauus Jacobi method can't be applied.
         return
      end
end
  merr=max(Err);
while merr>epsilon % Finding the final result.
    for m=1:1:row       
       C(m,1)=(1/P(m,m))*(P(m,col)-sum(A(m,:)*X(:,1))+A(m,m)*X(m,1));
       Err(m,1)= abs(C(m,1)-X(m,1));
    end 
    X(:,1)=C(:,1);
    merr=max(Err);
end
disp(' The required solution is:');
disp(X);
%fprintf('%1.5f \n', X(:,1)); 
