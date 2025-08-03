% clc;
% clear;
% This code is used to generate the impact of climate change on food production. 
% 
% three scenarios
% Temp in CUR scenario
mu = 1.2;
sigma = 0.1;
A1 = [mu-sigma;mu-sigma/2;mu;mu+sigma/2;mu+sigma];

% Temp in BAU to Case E scenario
mu = 2.85;
sigma = 0.48;
A2 = [mu-sigma;mu-sigma/2;mu;mu+sigma/2;mu+sigma];

% Temp in Case F scenario
mu = 2.05;
sigma = 0.1;
A3 = [mu-sigma;mu-sigma/2;mu;mu+sigma/2;mu+sigma];

AA=[A1;A2;A3];
save(strcat('output/AA','.dat'),'AA'); 

%% this code is used to calculated the eimssion in tha IIASA.

load('input\IIASA_input\CO2_Energy_IIASA.mat');
load('input\IIASA_input\CO2_total_IIASA.mat');
% Emissions|CO2, Mt CO2/yr
% 42 is the region (21 is China), 101 is the year (2000 to 2100), and 1291 is the scenario
% 1: World
% 21: China


load('input\IIASA_input\ScenarioID_Type.mat');
% Type=1→C1: Limiting warming to 1.5℃ (>50%) with no or limited overshoot
% Type=2→C2: return warming to 1.5℃ (>50%) after a high overshoot
% Type=3→C3: limit warming to 2℃ (>67%)
% Type=4→C4: limit warming to 2℃ (>50%)
% Type=5→C5: limit warming to 2.5℃ (>50%)
% Type=6→C6: limit warming to 3℃ (>50%)
% Type=7→C7: limit warming to 4℃ (>50%)
% Type=8→C8: exceed warming to 4℃ (>=50%)


%% calculate
IIASA_data=zeros(1291,6,101);
for yr=1:101
    IIASA_data(:,1:2,yr)=ScenarioID_Type;% col 1: scenario num; col 2: warming scenario
    for sce=1:1291
        IIASA_data(sce,3,yr)=CO2_total_IIASA(1,yr,sce);% total emission in IIASA in the whole world
        IIASA_data(sce,4,yr)=CO2_total_IIASA(21,yr,sce);% total emission in IIASA in the China
        IIASA_data(sce,5,yr)=CO2_Energy_IIASA(1,yr,sce);% energy emission in IIASA in the whole world
        IIASA_data(sce,6,yr)=CO2_Energy_IIASA(21,yr,sce);% energy emission in IIASA in the China
    end
end
% because there is to much nan in the total emission, and the energy emission is similar to total emission, so we take energy emission as a substitute

TE_sce=zeros(8,2);
Tsce=[1.33442;1.41292;1.62878;1.82502;2.11447;2.68847;3.47833;4.21913];
yr=101;
for sce=1:8
    idd=find(IIASA_data(:,2,yr)==sce & isnan(IIASA_data(:,3,yr))==0);
    TE_sce(sce,1)=mean(IIASA_data(idd,3,yr));
end
TE_sce(:,2)=Tsce;% the tempture in each scenario

idd=find(isnan(TE_sce(:,1))==0);
TE_scenew=TE_sce(idd,:);

[b,bint,r,rint,stats] = regress(TE_scenew(:,2),[TE_scenew(:,1) ones(size(idd,1),1)]);
%b储存的是系数

for sce=1:1291
    IIASA_data(sce,7,yr)=b(1)*IIASA_data(sce,3,yr)+b(2);%
end

for sce=1:8
    idd=find(IIASA_data(:,2,yr)==sce & isnan(IIASA_data(:,3,yr))==0);
    TE_sce(sce,3)=mean(IIASA_data(idd,7,yr));
end
save(strcat('output/IIASA_data','.dat'),'IIASA_data'); % IIASA_data(:,7) is the temp


% 
load(strcat('output/AA','.dat'),'-mat'); 
load(strcat('output/IIASA_data','.dat'),'-mat'); % IIASA_data(:,7) is the temp
idd=find(isnan(IIASA_data(:,7,101))==0 & isnan(IIASA_data(:,4,101))==0);
AAnew=[IIASA_data(idd,7,101)];
AAnew_monte=zeros(1,1);
for i=1:size(AAnew,1)
    if AAnew(i,1)<2.5
       AAnew_monte((i-1)*5+1:(i-1)*5+5,1)=[AAnew(i,1)-0.1 AAnew(i,1)-0.05 AAnew(i,1) AAnew(i,1)+0.05 AAnew(i,1)+0.1]; 
    elseif AAnew(i,1)>=2.5
       AAnew_monte((i-1)*5+1:(i-1)*5+5,1)=[AAnew(i,1)-0.48 AAnew(i,1)-0.24 AAnew(i,1) AAnew(i,1)+0.24 AAnew(i,1)+0.48]; 
    end
end
AAnew_montenew=[AA;AAnew_monte];


% calculate the crop yield by the method in siqing's paper

ID=xlsread('input/Yield_par', 'Yield', 'B2:C168'); % country 1_167; country+region. (31 is China)
Yield2020=xlsread('input/Yield_par', 'Yield', 'E2:I168'); % country 1_167; maize,rice,wheat,soybean,others (t/ha).(31 is China)
SSP26_lst=xlsread('input/Yield_par', 'SSP26_lst', 'B2:J402'); % year 1700-2100; region 1-9.
SSP45_lst=xlsread('input/Yield_par', 'SSP45_lst', 'B2:J402'); % year 1700-2100; region 1-9.
SSP85_lst=xlsread('input/Yield_par', 'SSP85_lst', 'B2:J402'); % year 1700-2100; region 1-9.
SSP26_lyp=xlsread('input/Yield_par', 'SSP26_lyp', 'B2:J402'); % year 1700-2100; region 1-9.
SSP45_lyp=xlsread('input/Yield_par', 'SSP45_lyp', 'B2:J402'); % year 1700-2100; region 1-9.
SSP85_lyp=xlsread('input/Yield_par', 'SSP85_lyp', 'B2:J402'); % year 1700-2100; region 1-9.
SSP26_CO2=xlsread('input/Yield_par', 'SSP26_CO2', 'B2:B402'); % year 1700-2100; global.
SSP45_CO2=xlsread('input/Yield_par', 'SSP45_CO2', 'B2:B402'); % year 1700-2100; global.
SSP85_CO2=xlsread('input/Yield_par', 'SSP85_CO2', 'B2:B402'); % year 1700-2100; global.
gamma_yieldP=xlsread('input/Yield_par', 'gamma', 'B2:B168'); % country 1_167.
T0=xlsread('input/Yield_par', 'T0', 'B2:E168'); % country 1_167, crops(maize,rice,wheat,soybean)


Para_A = [-0.0073,-0.0057,-0.0065,-0.0073,-0.0073,-0.0065,-0.0065,-0.0064,-0.0065];
Para_B = [0.146, 0.102, 0.117, 0.131, 0.131, 0.117, 0.117, 0.115, 0.117];
Para_C = [1.90,1.812,2.07,2.33,2.33, 2.07, 2.07, 2.04, 2.07];

Mai_A = [-0.0104,-0.0104,-0.0104,-0.0075,-0.0075,-0.0104,-0.0146,-0.0152,-0.0104];
Mai_B = [0.394,0.394,0.394,0.268,0.268,0.394,0.526,0.578,0.394];
Mai_C = [-2.22,-2.22,-2.22,-0.843,-0.843,-2.22,-3.01,-3.91,-2.22];

TCO2_A = -0.000002382;
TCO2_B = 0.003335;
TCO2_C = 0.124615;

Yield=zeros(167,4,101,4698);% 167 countries, 4 crops, 101 years(2000-2100), 3 SSPs(SSP2.6,SSP4.5 and SSP8.5, and 60 tempture scenarios, and 936 scenarios)
for kkk=1:4698
    Yield(:,:,22,kkk)=Yield2020(:,1:4);% crop yield in 2020 for SSP2.6
    if kkk==1
        for cn=1:167
            reg=ID(cn,2);
            for yr=1:102 % 1 is 1999 year, and 102 is 2100 year
                SSP_lst_co(cn,yr,kkk)=SSP26_lst(299+yr,reg);% lst in year 1999-2100, 2020(cn,22)
                SSP_lyp_co(cn,yr,kkk)=SSP26_lyp(299+yr,reg);% lyp in year 1999-2100, 2020(cn,22)
                SSP_CO2_co(cn,yr,kkk)=SSP26_CO2(299+yr,1);% CO2 in year 1999-2100, 2020(cn,22)
            end
        end
    elseif kkk==2
        for cn=1:167
            reg=ID(cn,2);
            for yr=1:102 % 1 is 1999 year, and 102 is 2100 year
                SSP_lst_co(cn,yr,kkk)=SSP45_lst(299+yr,reg);% lst in year 1999-2100, 2020(cn,22)
                SSP_lyp_co(cn,yr,kkk)=SSP45_lyp(299+yr,reg);% lyp in year 1999-2100, 2020(cn,22)
                SSP_CO2_co(cn,yr,kkk)=SSP45_CO2(299+yr,1);% CO2 in year 1999-2100, 2020(cn,22)
            end
        end
    elseif kkk==3
        for cn=1:167
            reg=ID(cn,2);
            for yr=1:102 % 1 is 1999 year, and 102 is 2100 year
                SSP_lst_co(cn,yr,kkk)=SSP85_lst(299+yr,reg);% lst in year 1999-2100, 2020(cn,22)
                SSP_lyp_co(cn,yr,kkk)=SSP85_lyp(299+yr,reg);% lyp in year 1999-2100, 2020(cn,22)
                SSP_CO2_co(cn,yr,kkk)=SSP85_CO2(299+yr,1);% CO2 in year 1999-2100, 2020(cn,22)
            end
        end
    elseif kkk>3
        for cn=1:167
            reg=ID(cn,2);
            for yr=1:102 % 1 is 1999 year, and 102 is 2100 year
                SSP_lst_co(cn,yr,kkk)=SSP45_lst(299+yr,reg);% lst in year 1999-2100, 2020(cn,22)
                SSP_lyp_co(cn,yr,kkk)=SSP45_lyp(299+yr,reg);% lyp in year 1999-2100, 2020(cn,22)
                SSP_CO2_co(cn,yr,kkk)=SSP45_CO2(299+yr,1);% CO2 in year 1999-2100, 2020(cn,22)
            end
        end
        SSP_lst_co(31,62,kkk)=1.2121*AAnew_montenew((kkk-3),1) + 1.6269;% lst in year 1999-2100, 2020(cn,22)
    end
    
    FCY_SSP = (TCO2_A*(SSP_CO2_co(1,22,kkk)+278)^2 + TCO2_B*(SSP_CO2_co(1,22,kkk)+278)+ TCO2_C)/(TCO2_A*278^2 + TCO2_B*278+ TCO2_C);% 2020 year (1,1),SSP_CO2_co is the same for 167 countries
    
    % CO2 concertration
    FC_SSP = zeros(1,102);
    FC_Ma_SSP = zeros(1,102);
    for yr=1:102
        if SSP_CO2_co(1,yr,kkk)+278<700
            FC_SSP(1,yr) = (TCO2_A*(SSP_CO2_co(1,yr,kkk)+278)^2 + TCO2_B*(SSP_CO2_co(1,yr,kkk)+278)+ TCO2_C)/(TCO2_A*278^2 + TCO2_B*278+ TCO2_C);
        elseif SSP_CO2_co(1,yr,kkk)+278>=700
            FC_SSP(1,yr) = (TCO2_A*700^2 + TCO2_B*700+ TCO2_C)/(TCO2_A*278^2 + TCO2_B*278+ TCO2_C);
        end
        if SSP_CO2_co(1,yr,kkk) > SSP_CO2_co(1,22,kkk)
            FC_Ma_SSP(1,yr) = FC_SSP(1,yr);
        elseif SSP_CO2_co(1,yr,kkk) <= SSP_CO2_co(1,22,kkk)
            FC_Ma_SSP(1,yr) = FCY_SSP;
        end
        
    end
    
    FT_Wh_SSP = zeros(167,102);
    
    % tempature
    for cn=1:167
        D_Ts_SSP = SSP_lst_co(cn,22,kkk);% start year (2020)
        reg=ID(cn,2);
        for yr=23:102
            tmin = 0*(Para_C(reg) - (Para_B(reg)^2)/(4*Para_A(reg)));
            tmin_Ma = 0*(Mai_C(reg) - (Mai_B(reg)^2)/(4*Mai_A(reg)));
            Xma = -Mai_B(reg)/2/Mai_A(reg);
            % Maize
            FTtCou_Ma_SSP(cn,yr) = max(tmin_Ma,Mai_A(reg)*(T0(cn,1)+SSP_lst_co(cn,yr,kkk)-D_Ts_SSP)^2 + Mai_B(reg)*(T0(cn,1)+SSP_lst_co(cn,yr,kkk)-D_Ts_SSP) + Mai_C(reg));
            FTsCou_Ma_SSP(cn,yr) = max(tmin_Ma,Mai_A(reg)*(T0(cn,1))^2 + Mai_B(reg)*(T0(cn,1)) + Mai_C(reg));
            if T0(cn,1)+SSP_lst_co(cn,yr,kkk)-D_Ts_SSP <Xma
                FTtCou_Ma_SSP(cn,yr) = Mai_A(reg)*(Xma)^2 + Mai_B(reg)*(Xma) + Mai_C(reg);
            end
            if T0(cn,1) <Xma
                FTsCou_Ma_SSP(cn,yr) = Mai_A(reg)*(Xma)^2 + Mai_B(reg)*(Xma) + Mai_C(reg);
            end
            if FTsCou_Ma_SSP(cn,yr)>0
                FT_Ma_SSP(cn,yr) = FTtCou_Ma_SSP(cn,yr)/FTsCou_Ma_SSP(cn,yr);
            end
            
            % Rice
            FTtCou_Ri_SSP(cn,yr) = max(tmin,Para_A(reg)*(T0(cn,2)+SSP_lst_co(cn,yr,kkk)-D_Ts_SSP)^2 + Para_B(reg)*(T0(cn,2)+SSP_lst_co(cn,yr,kkk)-D_Ts_SSP) + Para_C(reg));
            FTsCou_Ri_SSP(cn,yr) = max(tmin,Para_A(reg)*(T0(cn,2))^2 + Para_B(reg)*(T0(cn,2)) + Para_C(reg));
            if FTsCou_Ri_SSP(cn,yr)>0
                FT_Ri_SSP(cn,yr) = FTtCou_Ri_SSP(cn,yr)/FTsCou_Ri_SSP(cn,yr);
            end
            
            % Wheat
            FTtCou_Wh_SSP(cn,yr) = max(tmin,Para_A(reg)*(T0(cn,3)+SSP_lst_co(cn,yr,kkk)-D_Ts_SSP)^2 + Para_B(reg)*(T0(cn,3)+SSP_lst_co(cn,yr,kkk)-D_Ts_SSP) + Para_C(reg));
            FTsCou_Wh_SSP(cn,yr) = max(tmin,Para_A(reg)*(T0(cn,3))^2 + Para_B(reg)*(T0(cn,3)) + Para_C(reg));
            if FTsCou_Wh_SSP(cn,yr)>0
                FT_Wh_SSP(cn,yr) = FTtCou_Wh_SSP(cn,yr)/FTsCou_Wh_SSP(cn,yr);
            end
            
            % Soybean
            FTtCou_So_SSP(cn,yr) = max(tmin,Para_A(reg)*(T0(cn,4)+SSP_lst_co(cn,yr,kkk)-D_Ts_SSP)^2 + Para_B(reg)*(T0(cn,4)+SSP_lst_co(cn,yr,kkk)-D_Ts_SSP) + Para_C(reg));
            FTsCou_So_SSP(cn,yr) = max(tmin,Para_A(reg)*(T0(cn,4))^2 + Para_B(reg)*(T0(cn,4)) + Para_C(reg));
            if FTsCou_So_SSP(cn,yr)>0
                FT_So_SSP(cn,yr) = FTtCou_So_SSP(cn,yr)/FTsCou_So_SSP(cn,yr);
            end
            
            FP_SSP(cn,yr) = exp(gamma_yieldP(cn)*SSP_lyp_co(cn,yr,kkk))/exp(gamma_yieldP(cn)*SSP_lyp_co(cn,22,kkk));
        end
    end
    
    for cn=1:167
        for yr=23:102
            Yield(cn,1,yr,kkk)=Yield(cn,1,22,kkk)*FT_Ma_SSP(cn,yr).*FP_SSP(cn,yr);
            Yield(cn,2,yr,kkk)=Yield(cn,2,22,kkk)*FT_Ri_SSP(cn,yr).*FP_SSP(cn,yr);
            Yield(cn,3,yr,kkk)=Yield(cn,3,22,kkk)*FT_Wh_SSP(cn,yr).*FP_SSP(cn,yr);
            Yield(cn,4,yr,kkk)=Yield(cn,4,22,kkk)*FT_So_SSP(cn,yr).*FP_SSP(cn,yr);
        end
    end
end




Cropyield1999_2025=xlsread('input/Cropyield1999_2025', 'Sheet1', 'B5:E31'); % 1:4:maize, rice, wheat, and soybean yield during 1999 to 2025
Yield_ratio=zeros(167,4,101,4698);
for cn=1:167
    for ty=1:4
        for SSPsce=1:4698
            for yr=1:102
                if yr<=22 % ealier than 2020 year
                    Yield_ratio(cn,ty,yr,SSPsce)=Cropyield1999_2025(yr,ty)./Cropyield1999_2025(22,ty);
                elseif yr>=23 % later than 2021 year
                    Yield_ratio(cn,ty,yr,SSPsce)=Yield(cn,ty,yr,SSPsce)./Yield(cn,ty,22,SSPsce);
                end
            end
        end
    end
end


save(strcat('output/Yield','.dat'),'Yield','-v7.3'); % zeros(167,4,102,2);% 167 countries, 4 crops, 102 years(1999-2100), 2 SSPs(SSP2.6 and SSP8.5)
save(strcat('output/Yield_ratio','.dat'),'Yield_ratio','-v7.3'); % zeros(167,4,102,3);% 167 countries, 4 crops, 102 years(1999-2100;1 is for 1999,2 is for 2000;3 is for 2001), 2 SSPs(SSP2.6 and SSP8.5)
