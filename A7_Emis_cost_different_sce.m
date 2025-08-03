% 
% This code is used to generate data such as emissions, costs, and production for the scenario in the main text (CUR,Case A,Case B,Case C,Case D,Case E,and Case F)." 
clc;
clear;
load(strcat('output/Yield_ratio','.dat'),'-mat');
YSSP=2;
for Mo_EC=1:3
    display(Mo_EC)
    load(strcat('output/Co_figdata/Co_figdata','-',num2str(YSSP),'-',num2str(Mo_EC),'.dat'),'-mat');
    for Fsce=1:17
        for yr=61
            for co=1:2836
                if Co_figdata(co,2,yr,Fsce)==0
                    for ii=1:9
                        Co_figdata(co,ii,yr,Fsce)=0;
                    end
                end
            end
        end
    end

    % figure different scenarios
    Wp_col=[0 1 2]; % water price for 0, 1/2, 1, 3/2, 4/2
    Np_col=[0 1 2]; % water price for 0, 1/2, 1, 3/2, 4/2

    Forest=xlsread('input/crop_par', 'Forest', 'B2:L32'); % 1:pro_ID; 2:forest ratio in cropland (Mha/yr)
    R_for_cro=zeros(31,3);% 3 scenarios (20%,40% and 60% forest in cropland)
    for pp=1:31
        R_for_cro(pp,1)=Forest(pp,2)*0;% forest ratio (Mha/yr)
        R_for_cro(pp,2)=Forest(pp,2);
        R_for_cro(pp,3)=Forest(pp,2);% forest ratio (Mha/yr)
    end

    Fig_data=zeros(2836,13,17,2,2,2,5,2);
    for RFor=1:3
        display(RFor)
        Forest_pathway=ones(2836,61,4)*-99;
        % Prioritize forest conversion on land where production are low even with technological advances
        AF=zeros(2836,8,9);
        for co=1:2836
            for ii=1:6
                AF(co,1,ii)=co-1;
                AF(co,2,ii)=Co_figdata(co,1,61,ii);% cropland of each SSP sce
                AF(co,3,ii)=max(0,(Co_figdata(co,1,61,ii)-Co_figdata(co,1,61,6)));% cropland of each SSP sce-cropland_SSP5 (cropland increased by other SSP sce)
                AF(co,4,ii)=Co_figdata(co,1,61,8)-Co_figdata(co,1,61,6);% can be used for forest
                AF(co,5,ii)=(Co_figdata(co,2,61,15)/Co_figdata(co,1,61,15))-(Co_figdata(co,2,61,8)/Co_figdata(co,1,61,8));% increased pro
                AF(co,6,ii)=Co_figdata(co,7,61,8);% reduced forest
                AF(co,7,ii)=0;% can be used as forest
                AF(co,8,ii)=min([Co_figdata(co,1,61,8) Co_figdata(co,1,61,6)]);% remained for forest
            end
        end

        Co_Pro_Reg=xlsread('input/crop_par', 'Co_Pro_Reg', 'A2:E2837'); % 1: FID_CO;2:pro_ID;3:pro_num123;4:Reg
        for yr=61
            for pro=1:31
                Forest_goal=[zeros(26,1);ones(35,1)]*(R_for_cro(pro,RFor))*10^6;% forest area (ha)
                Forest_goal=cumsum(Forest_goal);
                idd_pro=find(Co_Pro_Reg(:,2)==Forest(pro,1));
                SelAF=zeros(size(idd_pro,1),8);
                SelAF(:,1:8)=AF(idd_pro,:,5);
                SelAF(:,10)=SelAF(:,5);% the lager, the high efficiency, (prior to low efficiency)
                SelAFnew=flipud(sortrows(SelAF,10));% (prior to high efficiency)
                Ratio_co(yr,pro,RFor)=min(1,max(0,sum(AF(idd_pro,6,5))+Forest_goal(61,1))/sum(SelAFnew(:,8)));
                SelAFnew(:,11)=SelAFnew(:,8)*Ratio_co(yr,pro,RFor);% SSP5
                SelAFnew(:,12)=cumsum(SelAFnew(:,11));% SSP5
                SelAFnew(:,13)=cumsum(SelAFnew(:,6));% total forest

                if pro==1
                    idd=find(((SelAFnew(:,12)-SelAFnew(:,13))-(Forest_goal(yr,1)))>=-0.01);
                    if size(idd,1)==0
                        idd=size(SelAFnew,1);
                    end
                    num1_xx=1;
                    num1_yy=idd(1);
                    Forest_pathway(num1_xx:num1_yy,yr,1)=SelAFnew(1:idd(1),1);% the co-ID of the select country for forest transform.
                    Forest_pathway(num1_xx:num1_yy,yr,2)=SelAFnew(1:idd(1),11);% the area of the select country for forest transform.
                elseif pro>1
                    idd=find(((SelAFnew(:,12)-SelAFnew(:,13))-(Forest_goal(yr,1)))>=-0.01);
                    if size(idd,1)==0
                        idd=size(SelAFnew,1);
                    end
                    num1_xx=num1_yy+1;
                    num1_yy=num1_yy+idd(1);
                    Forest_pathway(num1_xx:num1_yy,yr,1)=SelAFnew(1:idd(1),1);% the co-ID of the select country for forest transform.
                    Forest_pathway(num1_xx:num1_yy,yr,2)=SelAFnew(1:idd(1),11);% the area of the select country for forest transform.
                end
            end
        end
        save(strcat('output/Forest_pathway/Forest_pathway','-',num2str(YSSP),'-',num2str(RFor),'.dat'),'Forest_pathway','-v7.3');

        load(strcat('output/Forest_pathway/Forest_pathway','-',num2str(YSSP),'-',num2str(RFor),'.dat'),'-mat');
        S_co=zeros(2836,2,61);
        for yr=61
            S_dd=[Forest_pathway(:,yr,1) Forest_pathway(:,yr,2)];% CO ID and area of the select country for forest transform.
            S_bz=[S_dd;[[0:2835]' zeros(2836,1)]];
            for co=1:2836
                idd=find(S_bz(:,1)==co-1);
                S_co(co,1,yr)=co-1;
                S_co(co,2,yr)=max(S_bz(idd,2));
            end
        end
        for S_Te=1:5 % Temp for 2020 (1.2) [12], Temp for current (2.85) [31], and net zeros (2.05) [56] in 2060 year
            display(S_Te)
            if Mo_EC==1
                R_yield=(Yield_ratio(31,:,62,S_Te+3+(RFor-1)*5)./Yield_ratio(31,:,62,2))'.*1.05;% the yield ratio of temp degree to SSP4.5
            elseif Mo_EC==2
                R_yield=(Yield_ratio(31,:,62,S_Te+3+(RFor-1)*5)./Yield_ratio(31,:,62,2))'.*1.0;% the yield ratio of temp degree to SSP4.5
            elseif Mo_EC==3
                R_yield=(Yield_ratio(31,:,62,S_Te+3+(RFor-1)*5)./Yield_ratio(31,:,62,2))'.*0.95;% the yield ratio of temp degree to SSP4.5
            end
            for S_Wp=1:3
                R_Wp=Wp_col(S_Wp);% water price for 0, 1/2, 1, 3/2, 4/2
                for S_Np=1:3
                    R_Np=Np_col(S_Np);% N price for 0, 1/2, 1, 3/2, 4/2
                    for S_UR=2
                        if S_UR==1
                            Urban=2;% SSP1
                        elseif S_UR==2
                            Urban=3;% SSP2
                        elseif S_UR==3
                            Urban=6;% SSP5
                        end
                        Co_figdatanew=zeros(2836,66,61,17);
                        for Fsce=1:17
                            if Fsce<=6
                                %                             for yr=11:61
                                for yr=61
                                    Co_figdatanew(:,1,yr,Fsce)=Co_figdata(:,1,yr,Fsce);% Acrop (ha)
                                    Co_figdatanew(:,2,yr,Fsce)=Co_figdata(:,10,yr,Fsce).*R_yield(1,1)+Co_figdata(:,11,yr,Fsce).*R_yield(2,1)+Co_figdata(:,12,yr,Fsce).*R_yield(3,1)+Co_figdata(:,13,yr,Fsce).*R_yield(4,1);% crop production (t)
                                    Co_figdatanew(:,3,yr,Fsce)=Co_figdata(:,3,yr,Fsce);% water (m3)
                                    Co_figdatanew(:,4,yr,Fsce)=Co_figdata(:,4,yr,Fsce);% Nfer (kg N)
                                    Co_figdatanew(:,7,yr,Fsce)=Co_figdata(:,7,yr,Fsce);% Occupied forest area (ha)
                                    Co_figdatanew(:,8,yr,Fsce)=Co_figdata(:,8,yr,Fsce);% crop residue (t) 85% considered as biomass residue waste ratio
                                    IncreA_forest=zeros(2836,1); % Area of increased forest land
                                    Co_figdatanew(:,9,yr,Fsce)=Co_figdata(:,9,yr,Fsce);% Occupied forest +grassland area (ha)
                                    Co_figdatanew(:,10,yr,Fsce)=Co_figdata(:,10,yr,Fsce).*R_yield(1,1);% Maize_production
                                    Co_figdatanew(:,11,yr,Fsce)=Co_figdata(:,11,yr,Fsce).*R_yield(2,1);% Rice_production
                                    Co_figdatanew(:,12,yr,Fsce)=Co_figdata(:,12,yr,Fsce).*R_yield(3,1);% Wheat_production
                                    Co_figdatanew(:,13,yr,Fsce)=Co_figdata(:,13,yr,Fsce).*R_yield(4,1);% Soy_production
                                    for col=14:81
                                        Co_figdatanew(:,col,yr,Fsce)=Co_figdata(:,col,yr,Fsce);% Cost and emission
                                    end

                                    Co_figdatanew(:,26,yr,Fsce)=Co_figdata(:,26,yr,Fsce).*R_Np;% Cost_mai_Nfer
                                    Co_figdatanew(:,27,yr,Fsce)=Co_figdata(:,27,yr,Fsce).*R_Np;% Cost_ric_Nfer
                                    Co_figdatanew(:,28,yr,Fsce)=Co_figdata(:,28,yr,Fsce).*R_Np;% Cost_whe_Nfer
                                    Co_figdatanew(:,29,yr,Fsce)=Co_figdata(:,29,yr,Fsce).*R_Np;% Cost_soy_Nfer

                                    Co_figdatanew(:,30,yr,Fsce)=Co_figdata(:,30,yr,Fsce).*R_Wp;% Cost_mai_water
                                    Co_figdatanew(:,31,yr,Fsce)=Co_figdata(:,31,yr,Fsce).*R_Wp;% Cost_ric_water
                                    Co_figdatanew(:,32,yr,Fsce)=Co_figdata(:,32,yr,Fsce).*R_Wp;% Cost_whe_water
                                    Co_figdatanew(:,33,yr,Fsce)=Co_figdata(:,33,yr,Fsce).*R_Wp;% Cost_soy_water

                                    Co_figdatanew(:,5,yr,Fsce)=sum(Co_figdatanew(:,14:45,yr,Fsce),2);% cost
                                    Co_figdatanew(:,6,yr,Fsce)=sum(Co_figdatanew(:,46:81,yr,Fsce),2);% crop emis (t CO₂e)

                                    Co_figdatanew(:,82,yr,Fsce)=Co_figdata(:,82,yr,Fsce);% Acrop of maize (ha)
                                    Co_figdatanew(:,83,yr,Fsce)=Co_figdata(:,83,yr,Fsce);% Acrop of rice (ha)
                                    Co_figdatanew(:,84,yr,Fsce)=Co_figdata(:,84,yr,Fsce);% Acrop of wheat (ha)
                                    Co_figdatanew(:,85,yr,Fsce)=Co_figdata(:,85,yr,Fsce);% Acrop of soybean (ha)
                                end
                            elseif Fsce==7
                                Co_figdata(:,:,:,Fsce)=Co_figdata(:,:,:,Urban);% SSP5
                                Co_figdatanew(:,:,:,Fsce)=Co_figdatanew(:,:,:,Urban);% SSP5
                                for yr=61
                                    Sel_co=S_co(:,:,yr);
                                    idd=find(Sel_co(:,1)==-99);
                                    Sel_co(idd,:)=[];
                                    for nn=1:size(Sel_co,1)
                                        rr=Sel_co(nn,1)+1;% col of the select country
                                        S_FA=Sel_co(nn,2);
                                        Ra_area=max((Co_figdata(rr,1,yr,Fsce)-S_FA),0)/Co_figdata(rr,1,yr,Fsce);
                                        Co_figdatanew(rr,1,yr,Fsce)=(Co_figdata(rr,1,yr,Fsce)*Ra_area);% Acrop (ha)
                                        Co_figdatanew(rr,2,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*(Co_figdata(rr,10,yr,Fsce).*R_yield(1,1)+Co_figdata(rr,11,yr,Fsce).*R_yield(2,1)+Co_figdata(rr,12,yr,Fsce).*R_yield(3,1)+Co_figdata(rr,13,yr,Fsce).*R_yield(4,1));% crop production (t)
                                        Co_figdatanew(rr,3,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,3,yr,Fsce);% water (m3)
                                        Co_figdatanew(rr,4,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,4,yr,Fsce);% Nfer (kg N)
                                        Co_figdatanew(rr,7,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,7,yr,Fsce);% Occupied forest area (ha)
                                        Co_figdatanew(rr,8,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,8,yr,Fsce);% crop residue (t) 85% considered as biomass residue waste ratio
                                        IncreA_forest=0; % Area of increased forest land
                                        Co_figdatanew(rr,9,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,9,yr,Fsce);% Occupied forest +grassland area (ha)
                                        Co_figdatanew(rr,10,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,10,yr,Fsce).*R_yield(1,1);% Mazie_production
                                        Co_figdatanew(rr,11,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,11,yr,Fsce).*R_yield(2,1);% Rice_production
                                        Co_figdatanew(rr,12,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,12,yr,Fsce).*R_yield(3,1);% Wheat_production
                                        Co_figdatanew(rr,13,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,13,yr,Fsce).*R_yield(4,1);% Soybean_production
                                        for col=14:81
                                            Co_figdatanew(rr,col,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,col,yr,Fsce);% Emission and cost
                                        end

                                        Co_figdatanew(rr,26,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,26,yr,Fsce).*R_Np;% Cost_mai_Nfer
                                        Co_figdatanew(rr,27,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,27,yr,Fsce).*R_Np;% Cost_ric_Nfer
                                        Co_figdatanew(rr,28,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,28,yr,Fsce).*R_Np;% Cost_whe_Nfer
                                        Co_figdatanew(rr,29,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,29,yr,Fsce).*R_Np;% Cost_soy_Nfer

                                        Co_figdatanew(rr,30,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,30,yr,Fsce).*R_Wp;% Cost_mai_water
                                        Co_figdatanew(rr,31,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,31,yr,Fsce).*R_Wp;% Cost_ric_water
                                        Co_figdatanew(rr,32,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,32,yr,Fsce).*R_Wp;% Cost_whe_water
                                        Co_figdatanew(rr,33,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,33,yr,Fsce).*R_Wp;% Cost_soy_water

                                        Co_figdatanew(rr,5,yr,Fsce)=sum(Co_figdatanew(rr,14:45,yr,Fsce),2);% cost for increased forest area
                                        Co_figdatanew(rr,6,yr,Fsce)=sum(Co_figdatanew(rr,46:81,yr,Fsce),2);% crop emis (t CO₂e)


                                        Co_figdatanew(:,82,yr,Fsce)=Co_figdata(:,82,yr,Fsce)*Ra_area;% Acrop of maize (ha)
                                        Co_figdatanew(:,83,yr,Fsce)=Co_figdata(:,83,yr,Fsce)*Ra_area;% Acrop of rice (ha)
                                        Co_figdatanew(:,84,yr,Fsce)=Co_figdata(:,84,yr,Fsce)*Ra_area;% Acrop of wheat (ha)
                                        Co_figdatanew(:,85,yr,Fsce)=Co_figdata(:,85,yr,Fsce)*Ra_area;% Acrop of soybean (ha)
                                    end
                                end
                            elseif Fsce>=8 && Fsce<=17
                                Co_figdatanew(:,:,:,Fsce)=Co_figdatanew(:,:,:,Urban);% old SSP5 sce
                                for yr=61
                                    Sel_co=S_co(:,:,yr);
                                    idd=find(Sel_co(:,1)==-99);
                                    Sel_co(idd,:)=[];
                                    for nn=1:size(Sel_co,1)
                                        rr=Sel_co(nn,1)+1;% col of the select country
                                        S_FA=Sel_co(nn,2);
                                        Ra_area=max((Co_figdata(rr,1,yr,Fsce)+AF(rr,3,Urban)-S_FA),0)/Co_figdata(rr,1,yr,Fsce);
                                        Co_figdatanew(rr,1,yr,Fsce)=(Co_figdata(rr,1,yr,Fsce)*Ra_area);% Acrop (ha)
                                        Co_figdatanew(rr,2,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*(Co_figdata(rr,10,yr,Fsce).*R_yield(1,1)+Co_figdata(rr,11,yr,Fsce).*R_yield(2,1)+Co_figdata(rr,12,yr,Fsce).*R_yield(3,1)+Co_figdata(rr,13,yr,Fsce).*R_yield(4,1));% crop production (t)
                                        Co_figdatanew(rr,3,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,3,yr,Fsce);% water (m3)
                                        Co_figdatanew(rr,4,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,4,yr,Fsce);% Nfer (kg N)
                                        Co_figdatanew(rr,7,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,7,yr,Fsce);% Occupied forest area (ha)
                                        Co_figdatanew(rr,8,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,8,yr,Fsce);% crop residue (t) 85% considered as biomass residue waste ratio
                                        IncreA_forest=0; % Area of increased forest land
                                        Co_figdatanew(rr,9,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,9,yr,Fsce);% Occupied forest + grassland area (ha)
                                        Co_figdatanew(rr,10,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,10,yr,Fsce).*R_yield(1,1);% Maize_production
                                        Co_figdatanew(rr,11,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,11,yr,Fsce).*R_yield(2,1);% Rice_production
                                        Co_figdatanew(rr,12,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,12,yr,Fsce).*R_yield(3,1);% Wheat_production
                                        Co_figdatanew(rr,13,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,13,yr,Fsce).*R_yield(4,1);% Wheat_production
                                        for col=14:81
                                            Co_figdatanew(rr,col,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,col,yr,Fsce);% Emission and cost
                                        end
                                        Co_figdatanew(rr,26,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,26,yr,Fsce).*R_Np;% Cost_mai_Nfer
                                        Co_figdatanew(rr,27,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,27,yr,Fsce).*R_Np;% Cost_ric_Nfer
                                        Co_figdatanew(rr,28,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,28,yr,Fsce).*R_Np;% Cost_whe_Nfer
                                        Co_figdatanew(rr,29,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,29,yr,Fsce).*R_Np;% Cost_whe_Nfer

                                        Co_figdatanew(rr,30,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,30,yr,Fsce).*R_Wp;% Cost_mai_water
                                        Co_figdatanew(rr,31,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,31,yr,Fsce).*R_Wp;% Cost_ric_water
                                        Co_figdatanew(rr,32,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,32,yr,Fsce).*R_Wp;% Cost_whe_water
                                        Co_figdatanew(rr,33,yr,Fsce)=Co_figdatanew(rr,1,yr,Fsce)/Co_figdata(rr,1,yr,Fsce)*Co_figdata(rr,33,yr,Fsce).*R_Wp;% Cost_whe_water

                                        Co_figdatanew(rr,5,yr,Fsce)=sum(Co_figdatanew(rr,14:45,yr,Fsce),2);% cost for increased forest area
                                        Co_figdatanew(rr,6,yr,Fsce)=sum(Co_figdatanew(rr,46:81,yr,Fsce),2);% crop emis (t CO₂e)

                                        Co_figdatanew(:,82,yr,Fsce)=Co_figdata(:,82,yr,Fsce)*Ra_area;% Acrop of maize (ha)
                                        Co_figdatanew(:,83,yr,Fsce)=Co_figdata(:,83,yr,Fsce)*Ra_area;% Acrop of rice (ha)
                                        Co_figdatanew(:,84,yr,Fsce)=Co_figdata(:,84,yr,Fsce)*Ra_area;% Acrop of wheat (ha)
                                        Co_figdatanew(:,85,yr,Fsce)=Co_figdata(:,85,yr,Fsce)*Ra_area;% Acrop of soybean (ha)
                                    end
                                end
                            end
                        end
                        Co_figdatanew(isnan(Co_figdatanew)) =0;

                        for Fsce=1:17
                            for yr=61
                                Fig_data(:,1,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=Co_figdatanew(:,1,yr,Fsce); % Acrop (ha)
                                Fig_data(:,2,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=Co_figdatanew(:,2,yr,Fsce); % crop production (t)
                                Fig_data(:,3,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=Co_figdatanew(:,3,yr,Fsce); % water (m3)
                                Fig_data(:,4,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=Co_figdatanew(:,4,yr,Fsce); % Nfer (kg N)
                                Fig_data(:,5,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=Co_figdatanew(:,5,yr,Fsce); % crop cost ($)
                                Fig_data(:,6,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=Co_figdatanew(:,6,yr,Fsce); % crop emis (t CO₂e)
                                Fig_data(:,7,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=Co_figdatanew(:,7,yr,Fsce); % Occupied forest area (ha)
                                Fig_data(:,8,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=Co_figdatanew(:,8,yr,Fsce); % crop residue (t)
                                Fig_data(:,9,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=sum(Co_figdatanew(:,26:29,yr,Fsce),2); % Cost_Nfer ($)
                                Fig_data(:,10,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=sum(Co_figdatanew(:,30:33,yr,Fsce),2); % Cost_water ($)
                                Fig_data(:,11,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=Co_figdatanew(:,9,yr,Fsce); % Occupied forest +grassland area (ha)

                                Fig_data(:,12,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=sum(Co_figdatanew(:,14:17,yr,Fsce),2); % Cost_large scale farming ($)
                                Fig_data(:,13,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=sum(Co_figdatanew(:,46:49,yr,Fsce),2); % Emis_large scale farming (t CO2)
                                Fig_data(:,14,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=sum(Co_figdatanew(:,50:73,yr,Fsce),2); % C from agricultural emissions (energy) (Emis_ferpro,ele,fuel,plafilm,seed,pest)
                                Fig_data(:,15,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=sum(Co_figdatanew(:,74:77,yr,Fsce),2); % C from agricultural emissions (CH4)
                                Fig_data(:,16,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor)=sum(Co_figdatanew(:,78:81,yr,Fsce),2); % C from agricultural emissions (N2O)
                            end
                        end
                    end
                end
            end
        end
    end
    save(strcat('output\Fig_middata\Fig_data','-',num2str(Mo_EC),'.dat'),'Fig_data','-v7.3');
end



% % %
% % % BEC15 scenario-CUR
% % % Fsce=1;S_UR=2;S_Np=2;S_Wp=2;S_Te=1;RFor=1;S_Was=2;
% % % GP=0.27;
% % % PLand=(sum(Fig2_data(:,2,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor))./(sum(WoCal_Grain(:,3,Was(S_Was)))./sum(Ddietsce(:,3)))/1000*GP-sum(sum(Fig2_data(:,[8:12 14],Fsce,S_UR,S_Np,S_Wp,S_Te,RFor))))./sum(Fig2_data(:,1,Fsce,S_UR,S_Np,S_Wp,S_Te,RFor));% $/ha
% % % PLand
% %
% % % % %
% % % % % % %
% % % % % % %
% % % % % get to data to picture the new Fig.1
% % % % % % CF_MoBECCS=[(1*0.47*3.67*0.8+1*18*0.25/3.6*0.85)*(1-0.2)*77 (1*0.47*3.67*0.85+1*19*0.25/3.6*0.85)*(1-0.2)*77 (1*0.47*3.67*0.9+1*20*0.25/3.6*0.85)*(1-0.2)*77];% cost $/(t CO2)-1
% % % % % % EF_MoBECCS=[(1*0.47*3.67*0.9+1*20*0.25/3.6*0.85)*(1-0.2) (1*0.47*3.67*0.85+1*19*0.25/3.6*0.85)*(1-0.2) (1*0.47*3.67*0.8+1*18*0.25/3.6*0.85)*(1-0.2)];% emissions $/(t CO2)-1
% % % % % % % %
Co_dis=xlsread('input/Co_dis', 'Co_dis', 'C2:E2837'); % 1, 2 and 3 are the distance of county, province, and nation.
Co_Pro_Reg=xlsread('input/crop_par', 'Co_Pro_Reg', 'A2:E2837'); % 1: FID_CO;2:pro_ID;3:pro_num123;4:Reg
for cc=1:3
    Yield_EC(:,cc)=xlsread('input/BECCS_Yield', 'Yield', 'B2:B2837');
    Price_EC(:,cc)=xlsread('input/BECCS_Yield', 'Yield', 'C2:C2837');
    RYield_EC(:,cc)=Yield_EC(:,cc);
    RPrice_EC(:,cc)=Price_EC(:,cc);
    for co=1:2836
        if Price_EC(co,cc)>=1000
            RYield_EC(co,cc)=0;
            RPrice_EC(co,cc)=0;
        end
    end
end

RYield_EC(:,1)=RYield_EC(:,2)*1.05;
RYield_EC(:,3)=RYield_EC(:,2)*0.95;
RPrice_EC(:,1)=RPrice_EC(:,2)*0.8;
RPrice_EC(:,3)=RPrice_EC(:,2)*1.2;


CF_MoBECCS=[(1*0.47*3.67*0.90+1*19*0.25/3.6*0.90)*(1-0.10).*RPrice_EC(:,1) (1*0.47*3.67*0.90+1*19*0.25/3.6*0.90)*(1-0.10).*RPrice_EC(:,2) (1*0.47*3.67*0.90+1*19*0.25/3.6*0.90)*(1-0.10).*RPrice_EC(:,3)];% cost $/(t CO2)-1
EF_MoBECCS=[(1*0.47*3.67*0.90+1*19*0.25/3.6*0.90)*(1-0.10).*ones(2836,1) (1*0.47*3.67*0.90+1*19*0.25/3.6*0.90)*(1-0.10).*ones(2836,1) (1*0.47*3.67*0.90+1*19*0.25/3.6*0.90)*(1-0.10).*ones(2836,1)];% emissions $/(t CO2)-1
CC_EC=[(1*0.47*0.90) (1*0.47*0.90) (1*0.47*0.90)];
BECCS_reve=1*19/23*120;% 19GJ/t is bioenergy calories; 23 is coal calories; 120$/t is the price of coal.
Co_area=xlsread('input/Co_area', 'Co_area', 'B2:B2837')/10000; % ha

Water_BECCS=1*19*0.25/3.6*4.4; % t water (t biomass),  140 t water (t biomass)-1 for energy crops, and 4.4 t water (Mwh elec)-1
Nfer_BECCS=0.0131/0.5; % t N fertilizer (t biomass)
Nfer_ENE=0.0131*1000; % kg N fertilizer (t energy crop) Xing et al., 2021
Nfer_res=0.0069*1000; % kg N fertilizer (t agricultural residues) Xing et al., 2021

Ddietsce=xlsread('input/diet_sce', 'diet_sce', 'C2:F13'); % Vegetarian Health Current BAU .(kcal/capita/day) FAO and Erb, K. H., Lauk, C., Kastner, T., Mayer, A., Theurl, M. C., & Haberl, H. (2016). Exploring the biophysical option space for feeding the world without deforestation. Nature communications, 7(1), 11382.
load('output/WoCal_Grain.dat','-mat');% zeros(cty,cs,flw) 4 crops (maize,rice,wheat,soybean), 4 cal scenarios (Vegetarian Health Current Rich) and 2 loss and waste ratio
load(strcat('input/UNpop','.dat'),'-mat'); % (252,101,3) per capital, 48 is China, this is the UN pop for three scenarios (slow middle fast) for 251 countries and 91 years(2000-2100)

Pop2020=xlsread('input/Co_pop2020', 'Pop2020', 'B2:B2837');% pop in 2020

Pri_spe=50000*10^8/(100000*200);% 100 species one year*100year*15000grid, cost of reduced one species ($/species) (https://wwf.panda.org/discover/our_focus/biodiversity/biodiversity/) (https://www.ox.ac.uk/news/2023-12-14-5-trillion-nature-related-economic-risks-will-amplify-climate-change-says-oxford)
GraP=392;% % grian price of maize, rice, wheat, and soybean ($/ton)
load(strcat('output/AA','.dat'),'-mat');
Codata_step_Figdata=zeros(2836,10,5,13,2,2,2,3,3);
for Mo_EC=1:3
    display(Mo_EC)
    load(strcat('output\Fig_middata\Fig_data','-',num2str(Mo_EC),'.dat'),'-mat');
    for S_For=1:3 % forest ratio
    for S_warm=1:5
        display(S_warm)
            for S_Urb=2 % urbanization
                Urban=[1 2 3];
                for LEC=1:13 % with or without large scale farming and technology
                    display(LEC)
                    for S_Cal=1:2 % BECCS
                        for S_diet=1:2 % Dietary structure
                            for S_Was=1:2 % waste 11 % Xue, L., Liu, X., Lu, S., Cheng, G., Hu, Y., Liu, J., ... & Liu, G. (2021). China’s food loss and waste embodies increasing environmental impacts. Nature Food, 2(7), 519-528.
                                LosR=[0.35 0.15];
                                for Pgra=1
                                    GP=392;% $/t grain
                                    for S_Cpr=1 % carbon price 22
                                        cpr=0;
                                        for S_Pbi=2 % cost of biodiversity 11
                                            Pbio=[1 2 3];
                                            for S_Pop=2 % population
                                                if S_Pop==1 % pop in 2060
                                                    Rpop(:,S_Pop)=Pop2020./sum(Pop2020)*UNpop(48,61,1);% 2060 year
                                                elseif S_Pop==2 % pop in 2060
                                                    if S_For==1
                                                        Rpop(:,S_Pop)=Pop2020./sum(Pop2020)*UNpop(48,21,2);% 2020 year
                                                    elseif S_For>=2
                                                        Rpop(:,S_Pop)=Pop2020./sum(Pop2020)*UNpop(48,61,2);% 2060 year
                                                    end
                                                elseif S_Pop==3 % pop in 2060
                                                    Rpop(:,S_Pop)=Pop2020./sum(Pop2020)*UNpop(48,61,2);% 2060 year
                                                end
                                                for S_Pwa=2 % cost of water
                                                    P_water=[1 2 3];
                                                    for S_Pnf=2 % cost of N fer
                                                        P_Nfer=[1 2 3];

                                                        Sdata=zeros(2836,15,13);
                                                        Sdata(:,1:16,1)=Fig_data(:,:,1,Urban(S_Urb),P_Nfer(S_Pnf),P_water(S_Pwa),S_warm,S_For);% 1: no urbanization
                                                        Sdata(:,1:16,2)=Fig_data(:,:,1+Urban(S_Urb),Urban(S_Urb),P_Nfer(S_Pnf),P_water(S_Pwa),S_warm,S_For);% XX: urbanization under SSP-XX scenrio
                                                        Sdata(:,1:16,3)=Fig_data(:,:,7,Urban(S_Urb),P_Nfer(S_Pnf),P_water(S_Pwa),S_warm,S_For);% 7: Reforest
                                                        Sdata(:,1:16,4)=Fig_data(:,:,8,Urban(S_Urb),P_Nfer(S_Pnf),P_water(S_Pwa),S_warm,S_For);% 8:Future farm
                                                        Sdata(:,1:16,5)=Fig_data(:,:,9,Urban(S_Urb),P_Nfer(S_Pnf),P_water(S_Pwa),S_warm,S_For);% 9:fertilizer-enhancing FUE
                                                        Sdata(:,1:16,6)=Fig_data(:,:,10,Urban(S_Urb),P_Nfer(S_Pnf),P_water(S_Pwa),S_warm,S_For);% 10:fertilizer-optimized fertilizer
                                                        Sdata(:,1:16,7)=Fig_data(:,:,11,Urban(S_Urb),P_Nfer(S_Pnf),P_water(S_Pwa),S_warm,S_For);% 11:irrigation-enhancing efficiency
                                                        Sdata(:,1:16,8)=Fig_data(:,:,12,Urban(S_Urb),P_Nfer(S_Pnf),P_water(S_Pwa),S_warm,S_For);% 12:irrigation-full irrigation
                                                        Sdata(:,1:16,9)=Fig_data(:,:,13,Urban(S_Urb),P_Nfer(S_Pnf),P_water(S_Pwa),S_warm,S_For);% 13: Opt planting time
                                                        Sdata(:,1:16,10)=Fig_data(:,:,14,Urban(S_Urb),P_Nfer(S_Pnf),P_water(S_Pwa),S_warm,S_For);% 14:Opt plant density
                                                        Sdata(:,1:16,11)=Fig_data(:,:,15,Urban(S_Urb),P_Nfer(S_Pnf),P_water(S_Pwa),S_warm,S_For);% 15:Soil orgainc management
                                                        Sdata(:,1:16,12)=Fig_data(:,:,16,Urban(S_Urb),P_Nfer(S_Pnf),P_water(S_Pwa),S_warm,S_For);% 16:Opt cultivate
                                                        Sdata(:,1:16,13)=Fig_data(:,:,17,Urban(S_Urb),P_Nfer(S_Pnf),P_water(S_Pwa),S_warm,S_For);% 17:Multiple cropping
                                                        for col=1:13
                                                            Sdata(:,17,col)=Sdata(:,1,col).*RYield_EC(:,Mo_EC);% biomass of energy crop
                                                            Sdata(:,18,col)=Sdata(:,1,col).*RYield_EC(:,Mo_EC).*EF_MoBECCS(:,Mo_EC);% reduced emission of BECCS
                                                            Sdata(:,19,col)=Sdata(:,1,col).*RYield_EC(:,Mo_EC).*CF_MoBECCS(:,Mo_EC);% cost of BECCS
                                                            if S_diet==1
                                                                Sdata(:,20,col)=Sdata(:,2,col)./(sum(WoCal_Grain(:,3))./sum(Ddietsce([1 4 5 8 9 10],3))*365*sum(Rpop(:,S_Pop)));% cal (kcal) without reduce food waste 【the unit of (sum(WoCal_Grain(:,3,1))./sum(Ddietsce(:,3))) is t/kcal】
                                                            elseif S_diet==2
                                                                Sdata(:,20,col)=Sdata(:,2,col)./(sum(WoCal_Grain(:,2))./sum(Ddietsce([1 4 5 8 9 10],2))*365*sum(Rpop(:,S_Pop)));% cal (kcal) without reduce food waste 【the unit of (sum(WoCal_Grain(:,3,1))./sum(Ddietsce(:,3))) is t/kcal】
                                                            end
                                                            Sdata(:,21,col)=Sdata(:,8,col)*0.50;% biomass of crop residue [Integrated and spatially explicit assessment of sustainable crop residues potential in Europe]
                                                            Sdata(:,22,col)=Sdata(:,8,col)*0.50.*EF_MoBECCS(:,Mo_EC);% reduced emission of BECCS
                                                            Sdata(:,23,col)=Sdata(:,8,col)*0.50.*CF_MoBECCS(:,Mo_EC);% cost of BECCS
                                                        end
                                                        middata=[Sdata(:,1:23,LEC)];% Multiple cropping
                                                        middata(isnan(middata)) =0;middata(isinf(middata)) =0;
                                                        middatanew=middata;

                                                        YEnergy=RYield_EC(:,2);
                                                        if S_Cal==1
                                                            P_Gra=zeros(2836,2);P_Gra(:,1)=[0:2835]';
                                                            P_Gra(:,2)=middatanew(:,20)/1000*365*sum(Rpop(:,S_Pop));% total provided cal(Mcal)
                                                            Grain_pro =P_Gra(:,2);
                                                        elseif S_Cal==2 % cal sce is 1200
                                                            P_Gra=zeros(2836,2);P_Gra(:,1)=[0:2835]';
                                                            N_Gra=zeros(2836,2);N_Gra(:,1)=[0:2835]';
                                                            P_Gra(:,2)=middatanew(:,20)/1000*365*sum(Rpop(:,S_Pop));% total provided cal(Mcal)
                                                            ImpR=0.2; % import ratio of food
                                                            if S_diet==1
                                                                GraR=0.83; % ratio of grain in the cal scenario
                                                                N_Gra(:,2)=2800/1000*(1-ImpR)/(1-LosR(S_Was))*GraR*365*Rpop(:,S_Pop);%  total needed cal(Mcal)
                                                            elseif S_diet==2
                                                                GraR=0.73; % ratio of grain in the cal scenario
%                                                                 N_Gra(:,2)=2500/1000*(1-ImpR)/(1-LosR(S_Was))*GraR*365*Rpop(:,S_Pop);%  total needed cal(Mcal)
                                                                N_Gra(:,2)=2800/1000*(1-ImpR)/(1-LosR(S_Was))*GraR*365*Rpop(:,S_Pop);%  total needed cal(Mcal)
                                                            end
                                                            [PGrain,sour_dem]=CalPro(P_Gra,N_Gra,Co_dis,Co_Pro_Reg,YEnergy);
                                                            Grain_pro=PGrain;
                                                        end

                                                        R_Cal=[Grain_pro./P_Gra(:,2) (P_Gra(:,2)-Grain_pro)./P_Gra(:,2)];% ratio of grain production, and energycrop production
                                                        R_Cal(isnan(R_Cal)) =0; R_Cal(isinf(R_Cal)) =0;

                                                        Gra_prod=R_Cal(:,1).*middatanew(:,2);% t
                                                        Area=middatanew(:,1);% Acrop (ha)
                                                        Crop_area=R_Cal(:,1).*middatanew(:,1);% Acrop (ha)
                                                        Ene_area=R_Cal(:,2).*middatanew(:,1);% Acrop (ha)
                                                        woBECemis=middatanew(:,6);% emission without BECCS
                                                        emis=R_Cal(:,1).*(middatanew(:,6)-middatanew(:,13))+R_Cal(:,2).*middatanew(:,16).*Nfer_ENE./Nfer_res+middatanew(:,13)-R_Cal(:,1).*middatanew(:,22)-R_Cal(:,2).*middatanew(:,18);

                                                        BEC_prod(:,1)=R_Cal(:,1).*middatanew(:,21)+R_Cal(:,2).*middatanew(:,17);% production of BECCS
                                                        woBECcost=middatanew(:,5);
                                                        cost=R_Cal(:,1).*(middatanew(:,5)-middatanew(:,12))+middatanew(:,12)+R_Cal(:,1).*middatanew(:,23)+R_Cal(:,2).*middatanew(:,19)-BEC_prod(:,1)*BECCS_reve+R_Cal(:,1).*middatanew(:,2)*(S_Was-1)*375*0.20;

                                                        ImpR=0.2; % import ratio of food
                                                        if S_Cal==1
                                                            if S_diet==1
                                                                GraR=0.83; % ratio of grain in the cal scenario
                                                                cal(:,1)=middatanew(:,20)/(1-ImpR)*(1-LosR(S_Was))/GraR;% cal
                                                            elseif S_diet==2
                                                                GraR=0.73; % ratio of grain in the cal scenario
                                                                cal(:,1)=middatanew(:,20)/(1-ImpR)*(1-LosR(S_Was))/GraR;% cal
                                                            end
                                                        elseif S_Cal==2
                                                            if S_diet==1
                                                                GraR=0.83; % ratio of grain in the cal scenario
                                                                cal(:,1)=R_Cal(:,1).*middatanew(:,20)/(1-ImpR)*(1-LosR(S_Was))/GraR;% cal
                                                            elseif S_diet==2
                                                                GraR=0.73; % ratio of grain in the cal scenario
                                                                cal(:,1)=R_Cal(:,1).*middatanew(:,20)/(1-ImpR)*(1-LosR(S_Was))/GraR;% cal
                                                            end
                                                        end

                                                        Tcal=cal/1000*365*sum(Rpop(:,S_Pop));% total cal(Mcal)
                                                        CSink=((Gra_prod+BEC_prod).*CC_EC(:,Mo_EC));% tC, agricultural harvest carbon
                                                        NewArea=Area.*R_Cal(:,1);
                                                        
                                                        NNwoBECcost=middatanew(:,5)-middatanew(:,2).*GP;
                                                        NNcost=R_Cal(:,1).*(middatanew(:,5)-middatanew(:,12))+middatanew(:,12)+R_Cal(:,1).*middatanew(:,23)+R_Cal(:,2).*middatanew(:,19)-BEC_prod(:,1)*BECCS_reve+R_Cal(:,1).*middatanew(:,2)*(S_Was-1)*375*0.20-R_Cal(:,1).*middatanew(:,2).*GP;

                                                        Codata_step_Figdata(:,1:10,S_warm,LEC,S_Was,S_diet,S_Cal,S_For,Mo_EC)=[BEC_prod cost emis Tcal woBECcost woBECemis NewArea Area NNwoBECcost NNcost];
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
save(strcat('output\Fig_middata\Codata_step_Figdata','.dat'),'Codata_step_Figdata','-v7.3');


% different scenarios
% CUR without BECCS
LEC=1;S_Was=1;S_diet=1;S_Cal=1;S_For=1;
% BAU without BECCS
LEC=3;S_Was=1;S_diet=1;S_Cal=1;S_For=2;
% Case A (BAU with BECCS)
LEC=3;S_Was=1;S_diet=1;S_Cal=2;S_For=2;
% Case B (Large-scale farming with BECCS)
LEC=4;S_Was=1;S_diet=1;S_Cal=2;S_For=2;
% Case C (Reducing waste in the food chain with BECCS)
LEC=4;S_Was=2;S_diet=1;S_Cal=2;S_For=2;
% C-FER (Optimizing fertilization with BECCS)
LEC=6;S_Was=2;S_diet=1;S_Cal=2;S_For=2;
% C-IRR (Optimizing irrigation with BECCS)
LEC=8;S_Was=2;S_diet=1;S_Cal=2;S_For=2;
% C-GSS (Optimizing crop sowing with BECCS)
LEC=9;S_Was=2;S_diet=1;S_Cal=2;S_For=2;
% C-DEN (Optimizing the density of crops  with BECCS)
LEC=10;S_Was=2;S_diet=1;S_Cal=2;S_For=2;
% C-TIL (Applying conservation tillage with BECCS)
LEC=11;S_Was=2;S_diet=1;S_Cal=2;S_For=2;
% C-CUL (Breeding of high-yield cultivars with BECCS)
LEC=12;S_Was=2;S_diet=1;S_Cal=2;S_For=2;
% Case D (Growing triple-season rice with BECCS)
LEC=13;S_Was=2;S_diet=1;S_Cal=2;S_For=2;
% Case E ( Shifting from current diets to the planet health diet with BECCS)
LEC=13;S_Was=2;S_diet=2;S_Cal=2;S_For=2;
% Case F (Mitigating global warming from 2.8 to 2 °C with BECCS (OPT))
LEC=13;S_Was=2;S_diet=2;S_Cal=2;S_For=3;
