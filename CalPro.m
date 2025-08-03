function [PGrain,sour_dem] = CalPro(P_Gra,N_Gra,Co_dis,Co_Pro_Reg,YEnergy)
lb=zeros(2836,3);
ub=N_Gra(:,2);
u0=ub./45;
Anew=zeros(2836+31+1,2836*3);
Bnew=zeros(2836+31+1,1);
Aeq=zeros(2836,2836*3);
Beq=zeros(2836,1);

unitdis=[Co_dis(:,1)' Co_dis(:,2)' Co_dis(:,3)'];

mmd=zeros(2836,2836);
for co=1:2836
    mmd(co,co)=1;
end
Aeq=repmat(mmd,1,3);
Beq=N_Gra(:,2);%  total needed cal(Mcal)

Anew(1:2836,:)=[mmd zeros(2836,2836*2)];
Bnew(1:2836,1)=P_Gra(:,2);% total provided cal(Mcal)

nnd=zeros(31,2836);
for pro=1:31
    idpro=find(Co_Pro_Reg(:,3)==pro);
    nnd(pro,idpro)=1;
    Bnew(2836+pro,1)=sum(P_Gra(idpro,2));% total provided cal(Mcal)
end
Bnew(2836+31+1,1)=sum(P_Gra(:,2));% total provided cal(Mcal)

Anew(2836+1:2836+31,:)=[nnd nnd zeros(31,2836)];
Anew(2836+31+1,:)=ones(1,2836*3);

myoptions = optimset('Display','iter','MaxIter',100000);
[optT, TC] = linprog(unitdis,Anew,Bnew,Aeq,Beq,lb,ub,u0,myoptions);

if size(optT,1)>0
    Fcal=[optT(1:2836,1) optT(2837:2836*2,1)  optT(5673:2836*3,1)];% the cal from this country, this province, and this country
elseif size(optT,1)==0
    Fcal=[P_Gra(:,2) zeros(2836,2)];% the cal from this country, this province, and this country
end
PGrain=zeros(2836,1);
sour_dem=zeros(2836,2836);
PGrain=Fcal(:,1);
Sup_C=P_Gra(:,2)-Fcal(:,1);

for co=1:2836
    sour_dem(co,co)=Fcal(co,1);
end

for co=1:2836
    if Fcal(co,2)>0
        idpro=find(Co_Pro_Reg(:,3)==Co_Pro_Reg(co,3));
        if sum(Sup_C(idpro,1))>0
            SYEnergy=[Co_Pro_Reg(idpro,1) YEnergy(idpro,1)];
            SYEnergynew=sortrows(SYEnergy,2);
            co_dd=zeros(2836,1);
            for i=1:size(SYEnergynew,1)
                co_dd(SYEnergynew(i,1)+1,1)=min(Fcal(co,2),Sup_C(SYEnergynew(i,1)+1,1));
                Fcal(co,2)=Fcal(co,2)-min(Fcal(co,2),Sup_C(SYEnergynew(i,1)+1,1));
                if Fcal(co,2)==0
                    break;
                end
            end
            PGrain=PGrain+co_dd;
            Sup_C=Sup_C-co_dd;
            sour_dem(:,co)=sour_dem(:,co)+co_dd;
        end
    end
end

for co=1:2836
    if Fcal(co,3)>0
        if sum(Sup_C(:,1))>0
            SYEnergy=[Co_Pro_Reg(:,1) YEnergy(:,1)];
            SYEnergynew=sortrows(SYEnergy,2);
            co_dd=zeros(2836,1);
            for i=1:size(SYEnergynew,1)
                co_dd(SYEnergynew(i,1)+1,1)=min(Fcal(co,3),Sup_C(SYEnergynew(i,1)+1,1));
                Fcal(co,3)=Fcal(co,3)-min(Fcal(co,3),Sup_C(SYEnergynew(i,1)+1,1));
                if Fcal(co,3)==0
                    break;
                end
            end
            PGrain=PGrain+co_dd;
            Sup_C=Sup_C-co_dd;
            sour_dem(:,co)=sour_dem(:,co)+co_dd;
        end
    end
end
end