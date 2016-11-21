% load data
load data.mat


w1L=logisticreg(train1.X,train1.y);
w2L=logisticreg(train2.X,train2.y);
w3L=logisticreg(train3.X,train3.y);

w1F=fisherdiscriminant(train1.X, train1.y);
w2F=fisherdiscriminant(train2.X, train2.y);
w3F=fisherdiscriminant(train3.X, train3.y);


weights=[w1L w1F w2L w2F w3L w3F];
weightsn={'w1L' 'w1F' 'w2L' 'w2F' 'w3L' 'w3F'};

for i=1:6
   if(i<3)
      errorez(i)= errorrate(weights(:,i),test1);
      disp(['Errors for: ' weightsn{i} ' ' num2str( errorez(i))])
   elseif(i<5)
      errorez(i)= errorrate(weights(:,i),test2);
      disp(['Errors for: ' weightsn{i} ' ' num2str( errorez(i))])
   else
      errorez(i)= errorrate(weights(:,i),test3);
      disp(['Errors for: ' weightsn{i} ' ' num2str( errorez(i))])
   end
end

%Boundaries
figure;
boundary(weights(:,1:2),test1);
legend('Points group1','Points group2','Logistic reg','Fisher');
figure;
boundary(weights(:,3:4),test2);
legend('Points group1','Points group2','Logistic reg','Fisher');
figure;
boundary(weights(:,5:6),test3);
legend('Points group1','Points group2','Logistic reg','Fisher');




%4.
wL4=logisticreg(train1_2.X,train1_2.y);
wF4=fisherdiscriminant(train1_2.X, train1_2.y);
errL=errorrate(wL4,test1)
errF=errorrate(wF4,test1)
figure;
boundary([wL4 wF4],test1);
title('assignment 4')
hold on
plot(train1_2.X(end,1),train1_2.X(end,2),'k*')
legend('Points group1','Points group2','Logistic reg','Fisher');

%5.
wL5=logisticreg(train4.X,train4.y);
wF5=fisherdiscriminant(train4.X, train4.y);
errL=errorrate(wL5,test4)
errF=errorrate(wF5,test4)


