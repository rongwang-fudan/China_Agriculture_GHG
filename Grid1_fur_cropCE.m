% This code simulates China's future agricultural grain production and costs under large-scale farming scenarios.
% Case B

Farm_num=max(Farm_grid(:,6));
EC_Farm_fur=zeros(Farm_num,14);% each farm grid have one emission and cost.
Cost_Farm_fur=zeros(Farm_num,40);% each farm grid have one cost.
Emis_Farm_fur=zeros(Farm_num,40);% each farm grid have one emission.
Manure_cost=180/1000;% US $/kg; Commercial manure is 180 US$ t-1 (2021-Rethinking application of animal manure for wheat production in China)
Manure_Ccon=0.05;% Date source: Chen, X., Ma, C., Zhou, H., Liu, Y., Huang, X., Wang, M., ... & Zhang, F. (2021). Identifying the main crops and key factors determining the carbon footprint of crop production in China, 2001–2018. Resources, Conservation and Recycling, 172, 105661.
GWP_CH4=27;
GWP_N2O=273;
for i=1:Farm_num
%     display(i)
    CO_ID=Dfarmunit(i,1);
    
    Acrop=Dfarmunit(i,2);% crop land (ha)
    Abare=Dfarmunit(i,3);% bare land (ha)
    Agrass=Dfarmunit(i,4);% grass land (ha)
    Ashurb=Dfarmunit(i,5);% shurb land (ha)
    Aforest=Dfarmunit(i,6);% fores land (ha)
    InScrop=sum(Dfarmunit(i,3:6));% finally farm scale (ha)
    TScrop=sum(Dfarmunit(i,2:6));% finally farm scale (ha)
    
    Ymai=ThreeCropyield(CO_ID+1,1);% yield of maize （t/ha）
    Yric=ThreeCropyield(CO_ID+1,2);% yield of rice（t/ha）
    Ywhe=ThreeCropyield(CO_ID+1,3);% yield of wheat（t/ha）
    Ysoy=ThreeCropyield(CO_ID+1,4);% yield of soybean（t/ha）
    
    CAratio=zeros(1,4);
    if FCo_3yieldarea(CO_ID+1,11,61,2)>0
        CAratio=ThreeCroparea(CO_ID+1,1:4)./FCo_3yieldarea(CO_ID+1,11,61,2);% ratio of maize, rice and wheat area.
    end
    
    CropS_mai=TScrop*CAratio(1,1);% maize area
    CropS_ric=TScrop*CAratio(1,2);% rice area
    CropS_whe=TScrop*CAratio(1,3);% wheat area
    CropS_soy=TScrop*CAratio(1,4);% soybean area
    
    Pro_mai=CropS_mai*Ymai;% T grain
    Pro_ric=CropS_ric*Yric;% T grain
    Pro_whe=CropS_whe*Ywhe;% T grain
    Pro_soy=CropS_soy*Ysoy;% T grain
    
    maize_machcost=RCOmaize_cost(CO_ID+1,9)*1100/500;% $/ha % Gu baojing
    rice_machcost=RCOrice_cost(CO_ID+1,9)*1100/500;% $/ha
    wheat_machcost=RCOwheat_cost(CO_ID+1,9)*1100/500;% $/ha
    soy_machcost=RCOsoy_cost(CO_ID+1,9)*1100/500;% $/ha
        
    maize_laborcost=RCOmaize_cost(CO_ID+1,13)*2/3;% $/ha
    rice_laborcost=RCOrice_cost(CO_ID+1,13)*2/3;% $/ha
    wheat_laborcost=RCOwheat_cost(CO_ID+1,13)*2/3;% $/ha
    soy_laborcost=RCOsoy_cost(CO_ID+1,13)*2/3;% $/ha
    
    Cost_mai_conv=RCOmaize_cost(CO_ID+1,26)*InScrop*CAratio(1,1)/sum(CAratio(1,:));% $（农地开发整理新增耕地价格评估）
    Cost_ric_conv=RCOrice_cost(CO_ID+1,26)*InScrop*CAratio(1,2)/sum(CAratio(1,:));% $（农地开发整理新增耕地价格评估）
    Cost_whe_conv=RCOwheat_cost(CO_ID+1,26)*InScrop*CAratio(1,3)/sum(CAratio(1,:));% $（农地开发整理新增耕地价格评估）
    Cost_soy_conv=RCOsoy_cost(CO_ID+1,26)*InScrop*CAratio(1,4)/sum(CAratio(1,:));% $（农地开发整理新增耕地价格评估）
    
    Cost_conv=Cost_mai_conv+Cost_ric_conv+Cost_whe_conv+Cost_soy_conv;
    
    Cost_mai=Cost_mai_conv+CropS_mai*((sum(RCOmaize_cost(CO_ID+1,2:24))-sum(RCOmaize_cost(CO_ID+1,[9 13])))+maize_machcost+maize_laborcost);% US $
    Cost_ric=Cost_ric_conv+CropS_ric*((sum(RCOrice_cost(CO_ID+1,2:24))-sum(RCOrice_cost(CO_ID+1,[9 13])))+rice_machcost+rice_laborcost);% US $
    Cost_whe=Cost_whe_conv+CropS_whe*((sum(RCOwheat_cost(CO_ID+1,2:24))-sum(RCOwheat_cost(CO_ID+1,[9 13])))+wheat_machcost+wheat_laborcost);% US $
    Cost_soy=Cost_soy_conv+CropS_soy*((sum(RCOsoy_cost(CO_ID+1,2:24))-sum(RCOsoy_cost(CO_ID+1,[9 13])))+soy_machcost+soy_laborcost);% US $
    
    Cost_mai_Nfer=CropS_mai*RCOmaize_cost(CO_ID+1,3);
    Cost_ric_Nfer=CropS_ric*RCOrice_cost(CO_ID+1,3);
    Cost_whe_Nfer=CropS_whe*RCOwheat_cost(CO_ID+1,3);
    Cost_soy_Nfer=CropS_soy*RCOsoy_cost(CO_ID+1,3);
    Cost_Nfer=Cost_mai_Nfer+Cost_ric_Nfer+Cost_whe_Nfer+Cost_soy_Nfer;
           
    Cost_mai_mach=CropS_mai*maize_machcost;
    Cost_ric_mach=CropS_ric*rice_machcost;
    Cost_whe_mach=CropS_whe*wheat_machcost;
    Cost_soy_mach=CropS_soy*soy_machcost;
    Cost_mach=Cost_mai_mach+Cost_ric_mach+Cost_whe_mach+Cost_soy_mach;
    
    Cost_mai_water=CropS_mai*RCOmaize_cost(CO_ID+1,11);% full irrigation water
    Cost_ric_water=CropS_ric*RCOrice_cost(CO_ID+1,11);% $ full irrigation water
    Cost_whe_water=CropS_whe*RCOwheat_cost(CO_ID+1,11);% $ full irrigation water
    Cost_soy_water=CropS_soy*RCOsoy_cost(CO_ID+1,11);% $ full irrigation water
    Cost_water=Cost_mai_water+Cost_ric_water+Cost_whe_water+Cost_soy_water;
    
    Cost_mai_labor=CropS_mai*maize_laborcost;
    Cost_ric_labor=CropS_ric*rice_laborcost;
    Cost_whe_labor=CropS_whe*wheat_laborcost;
    Cost_soy_labor=CropS_soy*soy_laborcost;
    Cost_labor=Cost_mai_labor+Cost_ric_labor+Cost_whe_labor+Cost_soy_labor;
    
    Cost_mai_seed=CropS_mai*COmaize_cost(CO_ID+1,2);% seed cost,US $
    Cost_ric_seed=CropS_ric*COrice_cost(CO_ID+1,2);% seed cost,US $
    Cost_whe_seed=CropS_whe*COwheat_cost(CO_ID+1,2);% seed cost,US $
    Cost_soy_seed=CropS_soy*COsoy_cost(CO_ID+1,2);% seed cost,US $
    Cost_seed=Cost_mai_seed+Cost_ric_seed+Cost_whe_seed+Cost_soy_seed;% Total seed cost,US $
    
    Cost_mai_land=CropS_mai*COmaize_cost(CO_ID+1,24);% land cost,US $
    Cost_ric_land=CropS_ric*COrice_cost(CO_ID+1,24);% land cost,US $
    Cost_whe_land=CropS_whe*COwheat_cost(CO_ID+1,24);% land cost,US $
    Cost_soy_land=CropS_soy*COsoy_cost(CO_ID+1,24);% land cost,US $
    Cost_land=Cost_mai_land+Cost_ric_land+Cost_whe_land+Cost_soy_land;% Total land cost,US $
        
    Cost_mai_other=CropS_mai*((sum(RCOmaize_cost(CO_ID+1,2:24))-sum(RCOmaize_cost(CO_ID+1,[3 9 11 13 2 24]))));
    Cost_ric_other=CropS_ric*((sum(RCOrice_cost(CO_ID+1,2:24))-sum(RCOrice_cost(CO_ID+1,[3 9 11 13 2 24]))));
    Cost_whe_other=CropS_whe*((sum(RCOwheat_cost(CO_ID+1,2:24))-sum(RCOwheat_cost(CO_ID+1,[3 9 11 13 2 24]))));
    Cost_soy_other=CropS_soy*((sum(RCOsoy_cost(CO_ID+1,2:24))-sum(RCOsoy_cost(CO_ID+1,[3 9 11 13 2 24]))));
    Cost_other=Cost_mai_other+Cost_ric_other+Cost_whe_other+Cost_soy_other;
    
    Emis_mai_ferpro=CropS_mai*(sum(RCOmaize_input(CO_ID+1,4:6).*RCOmaize_EF(CO_ID+1,2:4)))/1000;% t CO₂e
    Emis_ric_ferpro=CropS_ric*(sum(RCOrice_input(CO_ID+1,4:6).*RCOrice_EF(CO_ID+1,2:4)))/1000;% t CO₂e
    Emis_whe_ferpro=CropS_whe*(sum(RCOwheat_input(CO_ID+1,4:6).*RCOwheat_EF(CO_ID+1,2:4)))/1000;% t CO₂e
    Emis_soy_ferpro=CropS_soy*(sum(RCOsoy_input(CO_ID+1,4:6).*RCOsoy_EF(CO_ID+1,2:4)))/1000;% t CO₂e
    Emis_ferpro=Emis_mai_ferpro+Emis_ric_ferpro+Emis_whe_ferpro+Emis_soy_ferpro;% t CO₂e
    
    Emis_mai_ele=CropS_mai*(RCOmaize_input(CO_ID+1,7).*RCOmaize_EF(CO_ID+1,5))/1000;% t CO₂e
    Emis_ric_ele=CropS_ric*(RCOrice_input(CO_ID+1,7).*RCOrice_EF(CO_ID+1,5))/1000;% t CO₂e
    Emis_whe_ele=CropS_whe*(RCOwheat_input(CO_ID+1,7).*RCOwheat_EF(CO_ID+1,5))/1000;% t CO₂e
    Emis_soy_ele=CropS_soy*(RCOsoy_input(CO_ID+1,7).*RCOsoy_EF(CO_ID+1,5))/1000;% t CO₂e
    Emis_ele=Emis_mai_ele+Emis_ric_ele+Emis_whe_ele+Emis_soy_ele;% t CO₂e
    
    Emis_mai_fuel=CropS_mai*(sum(RCOmaize_input(CO_ID+1,8:9).*RCOmaize_EF(CO_ID+1,6:7)))/1000;% t CO₂e
    Emis_ric_fuel=CropS_ric*(sum(RCOrice_input(CO_ID+1,8:9).*RCOrice_EF(CO_ID+1,6:7)))/1000;% t CO₂e
    Emis_whe_fuel=CropS_whe*(sum(RCOwheat_input(CO_ID+1,8:9).*RCOwheat_EF(CO_ID+1,6:7)))/1000;% t CO₂e
    Emis_soy_fuel=CropS_soy*(sum(RCOsoy_input(CO_ID+1,8:9).*RCOsoy_EF(CO_ID+1,6:7)))/1000;% t CO₂e
    Emis_fuel=Emis_mai_fuel+Emis_ric_fuel+Emis_whe_fuel+Emis_soy_fuel;% t CO₂e
    
    Emis_mai_plafilm=CropS_mai*(RCOmaize_input(CO_ID+1,10).*RCOmaize_EF(CO_ID+1,8))/1000;% t CO₂e
    Emis_ric_plafilm=CropS_ric*(RCOrice_input(CO_ID+1,10).*RCOrice_EF(CO_ID+1,8))/1000;% t CO₂e
    Emis_whe_plafilm=CropS_whe*(RCOwheat_input(CO_ID+1,10).*RCOwheat_EF(CO_ID+1,8))/1000;% t CO₂e
    Emis_soy_plafilm=CropS_soy*(RCOsoy_input(CO_ID+1,10).*RCOsoy_EF(CO_ID+1,8))/1000;% t CO₂e
    Emis_plafilm=Emis_mai_plafilm+Emis_ric_plafilm+Emis_whe_plafilm+Emis_soy_plafilm;% t CO₂e
    
    Emis_mai_seed=CropS_mai*(RCOmaize_input(CO_ID+1,11).*RCOmaize_EF(CO_ID+1,9))/1000;% t CO₂e
    Emis_ric_seed=CropS_ric*(RCOrice_input(CO_ID+1,11).*RCOrice_EF(CO_ID+1,9))/1000;% t CO₂e
    Emis_whe_seed=CropS_whe*(RCOwheat_input(CO_ID+1,11).*RCOwheat_EF(CO_ID+1,9))/1000;% t CO₂e
    Emis_soy_seed=CropS_soy*(RCOsoy_input(CO_ID+1,11).*RCOsoy_EF(CO_ID+1,9))/1000;% t CO₂e
    Emis_seed=Emis_mai_seed+Emis_ric_seed+Emis_whe_seed+Emis_soy_seed;% t CO₂e
    
    Emis_mai_pest=CropS_mai*(RCOmaize_input(CO_ID+1,12).*RCOmaize_EF(CO_ID+1,10))/1000;% t CO₂e
    Emis_ric_pest=CropS_ric*(RCOrice_input(CO_ID+1,12).*RCOrice_EF(CO_ID+1,10))/1000;% t CO₂e
    Emis_whe_pest=CropS_whe*(RCOwheat_input(CO_ID+1,12).*RCOwheat_EF(CO_ID+1,10))/1000;% t CO₂e
    Emis_soy_pest=CropS_soy*(RCOsoy_input(CO_ID+1,12).*RCOsoy_EF(CO_ID+1,10))/1000;% t CO₂e
    Emis_pest=Emis_mai_pest+Emis_ric_pest+Emis_whe_pest+Emis_soy_pest;% t CO₂e
    
    Emis_mai_CH4=CropS_mai*RCOmaize_EF(CO_ID+1,11)*GWP_CH4/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_ric_CH4=CropS_ric*RCOrice_EF(CO_ID+1,11)*GWP_CH4/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_whe_CH4=CropS_whe*RCOwheat_EF(CO_ID+1,11)*GWP_CH4/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_soy_CH4=CropS_soy*RCOsoy_EF(CO_ID+1,11)*GWP_CH4/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_CH4=Emis_mai_CH4+Emis_ric_CH4+Emis_whe_CH4+Emis_soy_CH4;% t CO₂e
    
    Emis_mai_ferapp=CropS_mai*(RCOmaize_input(CO_ID+1,4).*RCOmaize_EF(CO_ID+1,12))*44/28*GWP_N2O/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_ric_ferapp=CropS_ric*(RCOrice_input(CO_ID+1,4).*RCOrice_EF(CO_ID+1,12))*44/28*GWP_N2O/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_whe_ferapp=CropS_whe*(RCOwheat_input(CO_ID+1,4).*RCOwheat_EF(CO_ID+1,12))*44/28*GWP_N2O/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_soy_ferapp=CropS_soy*(RCOsoy_input(CO_ID+1,4).*RCOsoy_EF(CO_ID+1,12))*44/28*GWP_N2O/1000;% t CO₂e, Song, J., Liu, Y., Zhuang, M., Gu, W., Cui, Z., Pang, M., & Yang, Y. (2023). Estimating crop carbon footprint and associated uncertainty at prefecture-level city scale in China. Resources, Conservation and Recycling, 199, 107263.
    Emis_ferapp=Emis_mai_ferapp+Emis_ric_ferapp+Emis_whe_ferapp+Emis_soy_ferapp;% t CO₂e
    
    Emis_mai_ELUC=(Abare*ELUC_EF(1)+Agrass*(ELUC_EF(2)+ELUC_EF(3))+Ashurb*ELUC_EF(4)+Aforest*ELUC_EF(5))*CAratio(1,1)/sum(CAratio(1,:))/30/1000;% t CO2e
    Emis_ric_ELUC=(Abare*ELUC_EF(1)+Agrass*(ELUC_EF(2)+ELUC_EF(3))+Ashurb*ELUC_EF(4)+Aforest*ELUC_EF(5))*CAratio(1,2)/sum(CAratio(1,:))/30/1000;% t CO2e
    Emis_whe_ELUC=(Abare*ELUC_EF(1)+Agrass*(ELUC_EF(2)+ELUC_EF(3))+Ashurb*ELUC_EF(4)+Aforest*ELUC_EF(5))*CAratio(1,3)/sum(CAratio(1,:))/30/1000;% t CO2e
    Emis_soy_ELUC=(Abare*ELUC_EF(1)+Agrass*(ELUC_EF(2)+ELUC_EF(3))+Ashurb*ELUC_EF(4)+Aforest*ELUC_EF(5))*CAratio(1,4)/sum(CAratio(1,:))/30/1000;% t CO2e
    Emis_ELUC=Emis_mai_ELUC+Emis_ric_ELUC+Emis_whe_ELUC+Emis_soy_ELUC;% t CO2e
    
    % Date source: Chen, X., Ma, C., Zhou, H., Liu, Y., Huang, X., Wang, M., ... & Zhang, F. (2021). Identifying the main crops and key factors determining the carbon footprint of crop production in China, 2001–2018. Resources, Conservation and Recycling, 172, 105661.
    %     Emis_mai_SOC=CropS_mai*(((Ymai*1000*0.8*0+(Ymai*1000*0.8*0+Ymai*1000)/6.4)/1000*29.025+272.33)+RCOmaize_cost(CO_ID+1,6)/Manure_cost*Manure_Ccon*0.191+120*0.425)*44/12;% kg CO₂e, SOC due to residue retween, manure application, and no tilliage
    %     Emis_ric_SOC=CropS_ric*(((Yric*1000*1.1*0+(Yric*1000*1.1*0+Yric*1000)/4.6)/1000*29.025+272.33)+RCOrice_cost(CO_ID+1,6)/Manure_cost*Manure_Ccon*0.191+120*0.14)*44/12;% kg CO₂e, SOC due to residue retween, manure application, and no tilliage
    %     Emis_whe_SOC=CropS_whe*(((Ywhe*1000*0.9*0+(Ywhe*1000*0.9*0+Ywhe*1000)/3.2)/1000*29.025+272.33)+RCOwheat_cost(CO_ID+1,6)/Manure_cost*Manure_Ccon*0.191+120*0.153)*44/12;% kg CO₂e, SOC due to residue retween, manure application, and no tilliage
    %     Emis_SOC=Emis_mai_SOC+Emis_ric_SOC+Emis_whe_SOC;% kg CO₂e
    SR=SRario(CO_ID+1,1);
    
    Emis_mai_SOC=CropS_mai*(((Ymai*1000*0.8*SR+(Ymai*1000*0.8*SR+Ymai*1000)/6.4)/1000*29.025+272.33)+RCOmaize_cost(CO_ID+1,6)/Manure_cost*Manure_Ccon*0.191)*44/12/1000;% t CO₂e, SOC due to residue retween, manure application
    Emis_ric_SOC=CropS_ric*(((Yric*1000*1.1*SR+(Yric*1000*1.1*SR+Yric*1000)/4.6)/1000*29.025+272.33)+RCOrice_cost(CO_ID+1,6)/Manure_cost*Manure_Ccon*0.191)*44/12/1000;% t CO₂e, SOC due to residue retween, manure application
    Emis_whe_SOC=CropS_whe*(((Ywhe*1000*0.9*SR+(Ywhe*1000*0.9*SR+Ywhe*1000)/3.2)/1000*29.025+272.33)+RCOwheat_cost(CO_ID+1,6)/Manure_cost*Manure_Ccon*0.191)*44/12/1000;% t CO₂e, SOC due to residue retween, manure application
    Emis_soy_SOC=CropS_soy*(((Ysoy*1000*1.0*SR+(Ysoy*1000*1.0*SR+Ysoy*1000)/7.7)/1000*29.025+272.33)+RCOsoy_cost(CO_ID+1,6)/Manure_cost*Manure_Ccon*0.191)*44/12/1000;% t CO₂e, SOC due to residue retween, manure application
    Emis_SOC=Emis_mai_SOC+Emis_ric_SOC+Emis_whe_SOC+Emis_soy_SOC;% t CO₂e
    
    Residue_mai=CropS_mai*Ymai*0.8*(6.4/(6.4+1))*0.9;% t residue % SR is the ratio of straw return to soil ratio
    Residue_ric=CropS_ric*Yric*1.1*(4.6/(4.6+1))*0.9;% t residue % SR is the ratio of straw return to soil ratio
    Residue_whe=CropS_whe*Ywhe*0.9*(3.2/(3.2+1))*0.9;% t residue % SR is the ratio of straw return to soil ratio
    Residue_soy=CropS_soy*Ysoy*1.0*(7.7/(7.7+1))*0.9;% t residue % SR is the ratio of straw return to soil ratio
    Residue=Residue_mai+Residue_ric+Residue_whe+Residue_soy;% t residue
    
    Emis_mai=Emis_mai_ELUC+Emis_mai_ferpro+Emis_mai_ele+Emis_mai_fuel+Emis_mai_plafilm+Emis_mai_seed+Emis_mai_pest+Emis_mai_CH4+Emis_mai_ferapp-Emis_mai_SOC;
    Emis_ric=Emis_ric_ELUC+Emis_ric_ferpro+Emis_ric_ele+Emis_ric_fuel+Emis_ric_plafilm+Emis_ric_seed+Emis_ric_pest+Emis_ric_CH4+Emis_ric_ferapp-Emis_ric_SOC;
    Emis_whe=Emis_whe_ELUC+Emis_whe_ferpro+Emis_whe_ele+Emis_whe_fuel+Emis_whe_plafilm+Emis_whe_seed+Emis_whe_pest+Emis_whe_CH4+Emis_whe_ferapp-Emis_whe_SOC;
    Emis_soy=Emis_soy_ELUC+Emis_soy_ferpro+Emis_soy_ele+Emis_soy_fuel+Emis_soy_plafilm+Emis_soy_seed+Emis_soy_pest+Emis_soy_CH4+Emis_soy_ferapp-Emis_soy_SOC;
    
    maize_labornum=Cost_mai_labor/(150*5*15/7.17);% assume 150 yuan/day/person (王佳康，劳动力成本、机械化与农业产业升级)
    rice_labornum=Cost_ric_labor/(150*5*15/7.17);% assume 150 yuan/day/person (王佳康，劳动力成本、机械化与农业产业升级)
    wheat_labornum=Cost_whe_labor/(150*5*15/7.17);% assume 150 yuan/day/person (王佳康，劳动力成本、机械化与农业产业升级)
    soy_labornum=Cost_soy_labor/(150*5*15/7.17);% assume 150 yuan/day/person (王佳康，劳动力成本、机械化与农业产业升级)
    
    Water_mai=CropS_mai*RCOmaize_cost(CO_ID+1,25);% m3
    Water_ric=CropS_ric*RCOrice_cost(CO_ID+1,25);% m3
    Water_whe=CropS_whe*RCOwheat_cost(CO_ID+1,25);% m3
    Water_soy=CropS_soy*RCOsoy_cost(CO_ID+1,25);% m3
    
    Nfer_mai=CropS_mai*RCOmaize_input(CO_ID+1,4);% kg N
    Nfer_ric=CropS_ric*RCOrice_input(CO_ID+1,4);% kg N
    Nfer_whe=CropS_whe*RCOwheat_input(CO_ID+1,4);% kg N
    Nfer_soy=CropS_soy*RCOsoy_input(CO_ID+1,4);% kg N
    
    Pfer_mai=CropS_mai*RCOmaize_input(CO_ID+1,5);% kg P
    Pfer_ric=CropS_ric*RCOrice_input(CO_ID+1,5);% kg P
    Pfer_whe=CropS_whe*RCOwheat_input(CO_ID+1,5);% kg P
    Pfer_soy=CropS_soy*RCOsoy_input(CO_ID+1,5);% kg P
    
    EC_Farm_fur(i,1:14)=[CO_ID TScrop CropS_mai+CropS_ric+CropS_whe+CropS_soy Pro_mai+Pro_ric+Pro_whe+Pro_soy Cost_mai+Cost_ric+Cost_whe+Cost_soy Emis_mai+Emis_ric+Emis_whe+Emis_soy Residue_mai+Residue_ric+Residue_whe+Residue_soy Water_mai+Water_ric+Water_whe+Water_soy Nfer_mai+Nfer_ric+Nfer_whe+Nfer_soy Pfer_mai+Pfer_ric+Pfer_whe+Pfer_soy Abare Agrass Ashurb Aforest];
%     1:CO_ID;2:Acrop (ha);3:Crop sum area (ha);4:Crop production (t grain);5:Crop cost (US $);6:Crop emission (t CO₂e);7:Crop residue (t residue);8:Water (m3);9:Nfer (kg N);10:Pfer (kg P);11:bareland;12:grassland;13:shurbland;14:forest
   
    Cost_Farm_fur(i,1:40)=[Pro_mai Pro_ric Pro_whe Pro_soy Cost_mai_conv Cost_ric_conv Cost_whe_conv  Cost_soy_conv Cost_mai_mach Cost_ric_mach Cost_whe_mach Cost_soy_mach Cost_mai_labor Cost_ric_labor Cost_whe_labor Cost_soy_labor Cost_mai_Nfer Cost_ric_Nfer Cost_whe_Nfer Cost_soy_Nfer Cost_mai_water Cost_ric_water Cost_whe_water Cost_soy_water Cost_mai_seed Cost_ric_seed Cost_whe_seed Cost_soy_seed Cost_mai_land Cost_ric_land Cost_whe_land Cost_soy_land Cost_mai_other Cost_ric_other Cost_whe_other Cost_soy_other CropS_mai CropS_ric CropS_whe CropS_soy];%  US $
    Emis_Farm_fur(i,1:40)=[Emis_mai_ELUC Emis_ric_ELUC Emis_whe_ELUC Emis_soy_ELUC Emis_mai_ferpro Emis_ric_ferpro Emis_whe_ferpro Emis_soy_ferpro Emis_mai_ele Emis_ric_ele Emis_whe_ele Emis_soy_ele Emis_mai_fuel Emis_ric_fuel Emis_whe_fuel Emis_soy_fuel Emis_mai_plafilm Emis_ric_plafilm Emis_whe_plafilm Emis_soy_plafilm Emis_mai_seed Emis_ric_seed Emis_whe_seed Emis_soy_seed Emis_mai_pest Emis_ric_pest Emis_whe_pest Emis_soy_pest Emis_mai_CH4 Emis_ric_CH4 Emis_whe_CH4 Emis_soy_CH4 Emis_mai_ferapp Emis_ric_ferapp Emis_whe_ferapp Emis_soy_ferapp -Emis_mai_SOC -Emis_ric_SOC -Emis_whe_SOC -Emis_soy_SOC];% kg CO₂e
end


