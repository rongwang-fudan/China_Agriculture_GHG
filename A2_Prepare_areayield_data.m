% This code is used to generate the arable land area, as well as the grain yield under different technological managements at the county level in China.

% %
load('output\Grid001_data.dat','-mat');
% 1:FID;2:grid area;3:CO_ID;4:surimpreous;5:protect;6:available land;7:cropland2010;8:cropland2011;9:cropland2012;10:cropland2013;11:cropland2014;12:cropland2015;13:cropland2016;14:cropland2017;
% 15:cropland2018;16:cropland2019;17:cropland2020;18:cropland2021;19:cropland2022;20:forest;21:shrub;22:grass;23:wetland;24:cropland;25:urban;26:ice;27:barren;28:water;29:2022 sum ratio
load('output\curland.dat','-mat');% 1:country ID;2:cropland area(ha)
mai_yield =importdata('input\conso_land\cur_yieldarea\maize_yield.txt');% 2:country ID; 4:maize yield (t/ha)
ric_yield =importdata('input\conso_land\cur_yieldarea\rice_yield.txt');% 2:country ID; 4:rice yield (t/ha)
whe_yield =importdata('input\conso_land\cur_yieldarea\whe_yield.txt');% 2:country ID; 4:wheat yield (t/ha)
soy_yield =importdata('input\conso_land\cur_yieldarea\soy_yield.txt');% 2:country ID; 4:soybean yield (t/ha)
mai_area =importdata('input\conso_land\cur_yieldarea\maize_area.txt');% 2:country ID; 4:maize area (ha)
ric_area =importdata('input\conso_land\cur_yieldarea\rice_area.txt');% 2:country ID; 4:rice area (ha)
whe_area =importdata('input\conso_land\cur_yieldarea\whe_area.txt');% 2:country ID; 4:wheat area (ha)
soy_area =importdata('input\conso_land\cur_yieldarea\soy_area.txt');% 2:country ID; 4:soybean area (ha)
Co_yieldarea=zeros(2836,10);% yield of maize, rice, wheat, soybean,area of maize, rice, wheat, and soybean, and total grid
for i=1:2836
    display(i)
    coID=i-1;
    idx1=find(mai_yield(:,2)==coID);
    idx2=find(ric_yield(:,2)==coID);
    idx3=find(whe_yield(:,2)==coID);
    idx4=find(soy_yield(:,2)==coID);
    idx5=find(mai_area(:,2)==coID);
    idx6=find(ric_area(:,2)==coID);
    idx7=find(whe_area(:,2)==coID);
    idx8=find(soy_area(:,2)==coID);
    if size(idx1,1)>0
        Co_yieldarea(i,1)=mai_yield(idx1,4);
    end
    if size(idx2,1)>0
        Co_yieldarea(i,2)=ric_yield(idx2,4);
    end
    if size(idx3,1)>0
        Co_yieldarea(i,3)=whe_yield(idx3,4);
    end
    if size(idx4,1)>0
        Co_yieldarea(i,4)=soy_yield(idx4,4);
    end
    if size(idx5,1)>0
        Co_yieldarea(i,5)=mai_area(idx5,4);
    end
    if size(idx6,1)>0
        Co_yieldarea(i,6)=ric_area(idx6,4);
    end
    if size(idx7,1)>0
        Co_yieldarea(i,7)=whe_area(idx7,4);
    end
    if size(idx8,1)>0
        Co_yieldarea(i,8)=soy_area(idx8,4);
    end
end
for co=1:2836
    idx1=find(Grid001_data(:,3)==co-1);
    Co_yieldarea(co,9)=sum(Grid001_data(idx1,12));% 12 is the cropland for 2022 year
    idx2=find(curland(:,2)==co-1);
    Co_yieldarea(co,10)=mean(curland(idx2,4));% sum of land in each country.
end
save('output\Co_yieldarea.dat','Co_yieldarea','-v7.3');% yield of maize, rice, wheat, soybean,area of maize, rice, wheat, and soybean, average farmland scale (ha)


clear;
clc;
load('output\Co_yieldarea.dat','-mat');% 1:4：yield (2015 years) of maize, rice, wheat, soybean (https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/XGGJAV):5:8：area of maize, rice, wheat, and soybean, cropland area, average farmland scale (ha)
% % Co_4crops_area=importdata('input\Co_4crops_area.txt');% maize, rice and wheat area in China(2020 years) (骆玉川；张朝. 2000-2019 年全国三大粮食作物1km 种植分布数据集[DB/OL]. 国家生态科学数据中心, 2022. doi:10.12199/nesdc.ecodb.rs.2022.016. cstr: 15732.11.nesdc.ecodb.rs.2022.016);soybean area (https://figshare.com/articles/dataset/CROPGRIDS/22491997)
% % Co_yieldarea(:,5:8)=Co_4crops_area(:,3:6);
FID2836_2036=importdata('input\FID2836_2036.txt');
RCo_yieldarea=[FID2836_2036(:,1:2) Co_yieldarea];
Area_pro=xlsread('input/crop_par', 'Area_pro', 'B3:J33'); % 1:31 pro ID;2:5:maize, rice, wheat and soybean production (t), 6:9: maize, rice, wheat and soybean area (ha)
Yanzheng_proarea=zeros(31,4);
for gg=1:100
    for pro=1:31
        idd=find(RCo_yieldarea(:,2)==Area_pro(pro,1));
        SRCo_yieldarea=RCo_yieldarea(idd,:);% 7:10 is for maize(7), rice(8), wheat(9) and soybean(10) area.
        Pro_area=Area_pro(pro,:);% 6:9 is for maize(6), rice(7), wheat(8) and soybean(9) province area in 2020 year.
        % Maize area
        if Pro_area(1,6)>0
            if sum(SRCo_yieldarea(:,7))>0
                SRCo_yieldarea(:,7)=SRCo_yieldarea(:,7)/sum(SRCo_yieldarea(:,7))*Pro_area(1,6);
            end
        elseif Pro_area(1,6)==0
            SRCo_yieldarea(:,7)=0;
        end
        % Rice area
        if Pro_area(1,7)>0
            if sum(SRCo_yieldarea(:,8))>0
                SRCo_yieldarea(:,8)=SRCo_yieldarea(:,8)/sum(SRCo_yieldarea(:,8))*Pro_area(1,7);
            end
        elseif Pro_area(1,7)==0
            SRCo_yieldarea(:,8)=0;
        end
        % Wheat area
        if Pro_area(1,8)>0
            if sum(SRCo_yieldarea(:,9))>0
                SRCo_yieldarea(:,9)=SRCo_yieldarea(:,9)/sum(SRCo_yieldarea(:,9))*Pro_area(1,8);
            end
        elseif Pro_area(1,8)==0
            SRCo_yieldarea(:,9)=0;
        end
        % Soybean area
        if Pro_area(1,9)>0
            if sum(SRCo_yieldarea(:,10))>0
                SRCo_yieldarea(:,10)=SRCo_yieldarea(:,10)/sum(SRCo_yieldarea(:,10))*Pro_area(1,9);
            end
        elseif Pro_area(1,9)==0
            SRCo_yieldarea(:,10)=0;
        end
        
        for nn=1:size(idd,1)
            for col=7:10
                if SRCo_yieldarea(nn,col)>SRCo_yieldarea(nn,11)*2
                    SRCo_yieldarea(nn,col)=SRCo_yieldarea(nn,11)*2;
                end
            end
        end
        
        Yanzheng_proarea(pro,1:4)=sum(SRCo_yieldarea(:,7:10));
        for tt=1:size(idd,1)
            RCo_yieldarea(idd(tt),7:10)=SRCo_yieldarea(tt,7:10);
        end
    end
end
RCo_yieldarea(find(isnan(RCo_yieldarea)==1)) = 0;
sum(RCo_yieldarea(:,7:10))./sum(Area_pro(:,6:9))
[Area_pro(:,6:9) Yanzheng_proarea(:,:)];
[sum(Area_pro(:,6:9)) sum(Yanzheng_proarea(:,:))]

for ty=1:4
    for pro=1:31
        idd=find(RCo_yieldarea(:,2)==Area_pro(pro,1));
        SRCo_yieldarea=RCo_yieldarea(idd,:);
        if Area_pro(pro,1+ty)>0
            Ratio=Area_pro(pro,1+ty)/sum(RCo_yieldarea(idd,2+ty).*RCo_yieldarea(idd,6+ty));
        else
            Ratio=0;
        end
        RCo_yieldarea(idd,2+ty)=RCo_yieldarea(idd,2+ty).*Ratio;
    end
end


FCo_3yieldarea=zeros(2836,31,101,3);% 3 is for SSP26 and SSP85.
for YSSP=1:3
    for yr=1:101
        FCo_3yieldarea(:,1:2,yr,YSSP)=RCo_yieldarea(:,1:2);% ID of cou and province
        FCo_3yieldarea(:,3:6,yr,YSSP)=RCo_yieldarea(:,3:6);% yield of maize, rice, wheat and soybean in 2020
        FCo_3yieldarea(:,7:10,yr,YSSP)=RCo_yieldarea(:,7:10);% area of maize, rice, wheat and soybean in 2020
        FCo_3yieldarea(:,11:12,yr,YSSP)=RCo_yieldarea(:,11:12);% cropland area, farm scale
    end
end


IrrWater_use=xlsread('input/crop_par', 'Irrwater', 'B3:K33'); % 1:pro ID; 2: irrigation water area;3:6:irrigation water (m3) by maize, rice, wheat and soybean;7:10:cropland area (ha) by maize, rice, wheat and soybean.
IrrWater_par=zeros(31,9);
IrrWater_par(:,1)=IrrWater_use(:,1);% province ID
IrrWater_par(:,2)=IrrWater_use(:,2);% irrigation water area (ha)
for pro=1:31
    IrrWater_par(pro,3:6)=IrrWater_use(pro,7:10);% planting area of maize, rice, wheat and soybean (ha).
    IrrWater_par(pro,7)=min(1,max((IrrWater_par(pro,2)-IrrWater_par(pro,4)),0)/sum(IrrWater_par(pro,[3 5 6])));% irrigation ratio of maize and wheat, assume rice are full irrigation.
    if IrrWater_use(pro,7)>0
        IrrWater_par(pro,8)=IrrWater_use(pro,3)/(IrrWater_use(pro,7))/(0.2/2+(1-0.2));% (m3/ha) maize irrigation water m3 per ha without Water saving equipment. 0.2 is the assumed saving water equipment ratio
    end
    if IrrWater_use(pro,8)>0
        IrrWater_par(pro,9)=IrrWater_use(pro,4)/(IrrWater_use(pro,8))/(0.2/2+(1-0.2));% (m3/ha) rice irrigation water m3 per ha without Water saving equipment.0.2 is the assumed saving water equipment ratio
    end
    if IrrWater_use(pro,9)>0
        IrrWater_par(pro,10)=IrrWater_use(pro,5)/(IrrWater_use(pro,9))/(0.2/2+(1-0.2));% (m3/ha) wheat irrigation water m3 per ha without Water saving equipment.0.2 is the assumed saving water equipment ratio
    end
    if IrrWater_use(pro,10)>0
        IrrWater_par(pro,11)=IrrWater_use(pro,6)/(IrrWater_use(pro,10))/(0.2/2+(1-0.2));% (m3/ha) wheat irrigation water m3 per ha without Water saving equipment.0.2 is the assumed saving water equipment ratio
    end
    
end
IrrWater_par(find(isnan(IrrWater_par)==1)) = 0;

maize_Yspec=[18.42 1.93 35 5.36 10.91];% yield increased ratio of fertilizer, planting date,plant density,soil organic management, and cultivar
rice_Yspec=[14.08 17.03 20 0 19.68];% yield increased ratio of fertilizer, planting date,plant density,soil organic management, and cultivar
wheat_Yspec=[10.53 7.82 0 0 1.9];% yield increased ratio of fertilizer, planting date,plant density,soil organic management, and cultivar
soybean_Yspec=[22.7 7.9 3.1 0 13.1];% yield increased ratio of fertilizer, planting date,plant density,soil organic management, and cultivar

Co_agroecological_zones =xlsread('input/crop_par', 'Co_agroecological_zones', 'A2:E2837'); 

Maize_HY=[6.87 8.02 9.15 9.83];% Highest maize in South China, Center China, Northeast, Northwest.
Rice_HY=[7.07 8.07 8.03 8.97];% Highest rice in Southeast, Southwest, Yangtze River, North.
Wheat_HY=[4.43 7.01 7.2 5.68];% Highest wheat in Southwest, Center China, Yangtze River, North.
Soybean_HY=xlsread('input/crop_par', 'Ysoy_pot', 'B3:C33'); 
Co_Pro_Reg=xlsread('input/crop_par', 'Co_Pro_Reg', 'A2:E2837'); % 1: FID_CO;2:pro_ID;3:pro_num123;4:Reg


Cur_yield=zeros(3,4,101,2);
for az=1:4
    idd1=find(Co_agroecological_zones(:,3)==az);% Maize
    idd2=find(Co_agroecological_zones(:,4)==az);% Rice
    idd3=find(Co_agroecological_zones(:,5)==az);% Wheat
    for YSSP=1:3
        for yr=1:101
            Cur_yield(1,az,yr,YSSP)=sum(FCo_3yieldarea(idd1,3,yr,YSSP).*FCo_3yieldarea(idd1,7,yr,YSSP))/sum(FCo_3yieldarea(idd1,7,yr,YSSP));
            Cur_yield(2,az,yr,YSSP)=sum(FCo_3yieldarea(idd2,4,yr,YSSP).*FCo_3yieldarea(idd2,8,yr,YSSP))/sum(FCo_3yieldarea(idd2,8,yr,YSSP));
            Cur_yield(3,az,yr,YSSP)=sum(FCo_3yieldarea(idd3,5,yr,YSSP).*FCo_3yieldarea(idd3,9,yr,YSSP))/sum(FCo_3yieldarea(idd3,9,yr,YSSP));

            FCo_3yieldarea(idd1,13,yr,YSSP)=FCo_3yieldarea(idd1,3,yr,YSSP).*(1+(max(1,(Maize_HY(az)/Cur_yield(1,az,yr,YSSP)))-1)*sum(maize_Yspec(1,1))/sum(maize_Yspec(1,1:5)));% fertilizer, maize yield  (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
            FCo_3yieldarea(idd2,14,yr,YSSP)=FCo_3yieldarea(idd2,4,yr,YSSP).*(1+(max(1,(Rice_HY(az)/Cur_yield(2,az,yr,YSSP)))-1)*sum(rice_Yspec(1,1))/sum(rice_Yspec(1,1:5)));% fertilizer,  rice yield
            FCo_3yieldarea(idd3,15,yr,YSSP)=FCo_3yieldarea(idd3,5,yr,YSSP).*(1+(max(1,(Wheat_HY(az)/Cur_yield(3,az,yr,YSSP)))-1)*sum(wheat_Yspec(1,1))/sum(wheat_Yspec(1,1:5)));%  fertilizer, wheat yield  (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)

            shiyan(az,1)=(1+(max(1,(Maize_HY(az)/Cur_yield(1,az,yr,YSSP)))-1)*sum(maize_Yspec(1,1))/sum(maize_Yspec(1,1:5)));
        end
    end
end

Cur_yield=zeros(31,101,2);
for pro=1:31
    idd4=find(Co_Pro_Reg(:,2)==Soybean_HY(pro,1));% Soybean
    for YSSP=1:3
        for yr=1:101
            Cur_yield(pro,yr,YSSP)=sum(FCo_3yieldarea(idd4,6,yr,YSSP).*FCo_3yieldarea(idd4,10,yr,YSSP))/sum(FCo_3yieldarea(idd4,10,yr,YSSP));
            FCo_3yieldarea(idd4,16,yr,YSSP)=FCo_3yieldarea(idd4,6,yr,YSSP).*(1+(max(1,(Soybean_HY(pro,2)/Cur_yield(pro,yr,YSSP)))-1)*sum(soybean_Yspec(1,1))/sum(soybean_Yspec(1,1:5)));% fertilizer, maize yield  (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
        end
    end
end


for co=1:2836
    for YSSP=1:3
        for yr=1:101
            id_pro=FCo_3yieldarea(co,2,yr,YSSP);
            idd=find(IrrWater_par(:,1)==id_pro);
            if IrrWater_par(idd,7)<=0.001
                IrrWater_par(idd,7)=0.67;
            end
            irr_ratio=IrrWater_par(idd,7);% irrigation ratio of maize and wheat, assume rice are full irrigation.
            FCo_3yieldarea(co,17,yr,YSSP)=FCo_3yieldarea(co,13,yr,YSSP)/(irr_ratio*1.22+(1-irr_ratio))*1.22;% full irrigation maize yield (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
            FCo_3yieldarea(co,18,yr,YSSP)=FCo_3yieldarea(co,14,yr,YSSP);% full irrigation rice yield
            FCo_3yieldarea(co,19,yr,YSSP)=FCo_3yieldarea(co,15,yr,YSSP)/(irr_ratio*1.34+(1-irr_ratio))*1.34;% full irrigation wheat yield (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
            FCo_3yieldarea(co,20,yr,YSSP)=FCo_3yieldarea(co,16,yr,YSSP)/(irr_ratio*1.28+(1-irr_ratio))*1.28;% full irrigation wheat yield (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
        end
    end
end

Cur_yield=zeros(3,4,101,2);
for az=1:4
    idd1=find(Co_agroecological_zones(:,3)==az);% Maize
    idd2=find(Co_agroecological_zones(:,4)==az);% Rice
    idd3=find(Co_agroecological_zones(:,5)==az);% Wheat
    for YSSP=1:3
        for yr=1:101
            
            for ii=1:size(idd1,1)
                id_pro=FCo_3yieldarea(idd1(ii),2,yr,YSSP);
                idd=find(IrrWater_par(:,1)==id_pro);
                if IrrWater_par(idd,7)<=0.001
                    IrrWater_par(idd,7)=0.67;
                end
                irr_ratio=IrrWater_par(idd,7);% irrigation ratio of maize and wheat, assume rice are full irrigation.
                Cur_yield(1,az,yr,YSSP)=sum(FCo_3yieldarea(idd1,3,yr,YSSP).*FCo_3yieldarea(idd1,7,yr,YSSP))/sum(FCo_3yieldarea(idd1,7,yr,YSSP));
                FCo_3yieldarea(idd1(ii),21,yr,YSSP)=FCo_3yieldarea(idd1(ii),3,yr,YSSP).*(1+(max(1,(Maize_HY(az)/Cur_yield(1,az,yr,YSSP)))-1)*sum(maize_Yspec(1,1:2))/sum(maize_Yspec(1,1:5)))/(irr_ratio*1.22+(1-irr_ratio))*1.22;% planting date maize yield  (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
                FCo_3yieldarea(idd1(ii),25,yr,YSSP)=FCo_3yieldarea(idd1(ii),3,yr,YSSP).*(1+(max(1,(Maize_HY(az)/Cur_yield(1,az,yr,YSSP)))-1)*sum(maize_Yspec(1,1:3))/sum(maize_Yspec(1,1:5)))/(irr_ratio*1.22+(1-irr_ratio))*1.22;% plant density maize yield  (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
                FCo_3yieldarea(idd1(ii),29,yr,YSSP)=FCo_3yieldarea(idd1(ii),3,yr,YSSP).*(1+(max(1,(Maize_HY(az)/Cur_yield(1,az,yr,YSSP)))-1)*sum(maize_Yspec(1,1:4))/sum(maize_Yspec(1,1:5)))/(irr_ratio*1.22+(1-irr_ratio))*1.22;% soil organic management maize yield  (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
                FCo_3yieldarea(idd1(ii),33,yr,YSSP)=FCo_3yieldarea(idd1(ii),3,yr,YSSP).*(1+(max(1,(Maize_HY(az)/Cur_yield(1,az,yr,YSSP)))-1)*sum(maize_Yspec(1,1:5))/sum(maize_Yspec(1,1:5)))/(irr_ratio*1.22+(1-irr_ratio))*1.22;% cultivar maize yield  (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
            end
            
            
            for ii=1:size(idd2,1)
                id_pro=FCo_3yieldarea(idd2(ii),2,yr,YSSP);
                idd=find(IrrWater_par(:,1)==id_pro);
                if IrrWater_par(idd,7)<=0.001
                    IrrWater_par(idd,7)=0.67;
                end
                irr_ratio=IrrWater_par(idd,7);% irrigation ratio of maize and wheat, assume rice are full irrigation.
                Cur_yield(2,az,yr,YSSP)=sum(FCo_3yieldarea(idd2,4,yr,YSSP).*FCo_3yieldarea(idd2,8,yr,YSSP))/sum(FCo_3yieldarea(idd2,8,yr,YSSP));
                FCo_3yieldarea(idd2(ii),22,yr,YSSP)=FCo_3yieldarea(idd2(ii),4,yr,YSSP).*(1+(max(1,(Rice_HY(az)/Cur_yield(2,az,yr,YSSP)))-1)*sum(rice_Yspec(1,1:2))/sum(rice_Yspec(1,1:5)));% planting date rice yield
                FCo_3yieldarea(idd2(ii),26,yr,YSSP)=FCo_3yieldarea(idd2(ii),4,yr,YSSP).*(1+(max(1,(Rice_HY(az)/Cur_yield(2,az,yr,YSSP)))-1)*sum(rice_Yspec(1,1:3))/sum(rice_Yspec(1,1:5)));% plant density rice yield
                FCo_3yieldarea(idd2(ii),30,yr,YSSP)=FCo_3yieldarea(idd2(ii),4,yr,YSSP).*(1+(max(1,(Rice_HY(az)/Cur_yield(2,az,yr,YSSP)))-1)*sum(rice_Yspec(1,1:4))/sum(rice_Yspec(1,1:5)));% soil organic management rice yield
                FCo_3yieldarea(idd2(ii),34,yr,YSSP)=FCo_3yieldarea(idd2(ii),4,yr,YSSP).*(1+(max(1,(Rice_HY(az)/Cur_yield(2,az,yr,YSSP)))-1)*sum(rice_Yspec(1,1:5))/sum(rice_Yspec(1,1:5)));% cultivar rice yield
            end
            
            for ii=1:size(idd3,1)
                id_pro=FCo_3yieldarea(idd3(ii),2,yr,YSSP);
                idd=find(IrrWater_par(:,1)==id_pro);
                if IrrWater_par(idd,7)<=0.001
                    IrrWater_par(idd,7)=0.67;
                end
                irr_ratio=IrrWater_par(idd,7);% irrigation ratio of maize and wheat, assume rice are full irrigation.
                Cur_yield(3,az,yr,YSSP)=sum(FCo_3yieldarea(idd3,5,yr,YSSP).*FCo_3yieldarea(idd3,9,yr,YSSP))/sum(FCo_3yieldarea(idd3,9,yr,YSSP));
                FCo_3yieldarea(idd3(ii),23,yr,YSSP)=FCo_3yieldarea(idd3(ii),5,yr,YSSP).*(1+(max(1,(Wheat_HY(az)/Cur_yield(3,az,yr,YSSP)))-1)*sum(wheat_Yspec(1,1:2))/sum(wheat_Yspec(1,1:5)))/(irr_ratio*1.34+(1-irr_ratio))*1.34;% planting date wheat yield  (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
                FCo_3yieldarea(idd3(ii),27,yr,YSSP)=FCo_3yieldarea(idd3(ii),5,yr,YSSP).*(1+(max(1,(Wheat_HY(az)/Cur_yield(3,az,yr,YSSP)))-1)*sum(wheat_Yspec(1,1:3))/sum(wheat_Yspec(1,1:5)))/(irr_ratio*1.34+(1-irr_ratio))*1.34;%  plant density wheat yield  (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
                FCo_3yieldarea(idd3(ii),31,yr,YSSP)=FCo_3yieldarea(idd3(ii),5,yr,YSSP).*(1+(max(1,(Wheat_HY(az)/Cur_yield(3,az,yr,YSSP)))-1)*sum(wheat_Yspec(1,1:4))/sum(wheat_Yspec(1,1:5)))/(irr_ratio*1.34+(1-irr_ratio))*1.34;% soil organic management wheat yield  (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
                FCo_3yieldarea(idd3(ii),35,yr,YSSP)=FCo_3yieldarea(idd3(ii),5,yr,YSSP).*(1+(max(1,(Wheat_HY(az)/Cur_yield(3,az,yr,YSSP)))-1)*sum(wheat_Yspec(1,1:5))/sum(wheat_Yspec(1,1:5)))/(irr_ratio*1.34+(1-irr_ratio))*1.34;% cultivar wheat yield  (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
            end
            
        end
    end
end

Cur_yield=zeros(31,101,2);
for pro=1:31
    idd4=find(Co_Pro_Reg(:,2)==Soybean_HY(pro,1));% Soybean
    for YSSP=1:3
        for yr=1:101
            for ii=1:size(idd4,1)
                id_pro=FCo_3yieldarea(idd4(ii),2,yr,YSSP);
                idd=find(IrrWater_par(:,1)==id_pro);
                if IrrWater_par(idd,7)<=0.001
                    IrrWater_par(idd,7)=0.67;
                end
                irr_ratio=IrrWater_par(idd,7);% irrigation ratio of maize and wheat, assume rice are full irrigation.
                Cur_yield(pro,yr,YSSP)=sum(FCo_3yieldarea(idd4,6,yr,YSSP).*FCo_3yieldarea(idd4,10,yr,YSSP))/sum(FCo_3yieldarea(idd4,10,yr,YSSP));
                FCo_3yieldarea(idd4(ii),24,yr,YSSP)=FCo_3yieldarea(idd4(ii),6,yr,YSSP).*(1+(max(1,(Soybean_HY(pro,2)/Cur_yield(pro,yr,YSSP)))-1)*sum(soybean_Yspec(1,1:2))/sum(soybean_Yspec(1,1:5)))/(irr_ratio*1.28+(1-irr_ratio))*1.28;% planting date maize yield  (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
                FCo_3yieldarea(idd4(ii),28,yr,YSSP)=FCo_3yieldarea(idd4(ii),6,yr,YSSP).*(1+(max(1,(Soybean_HY(pro,2)/Cur_yield(pro,yr,YSSP)))-1)*sum(soybean_Yspec(1,1:3))/sum(soybean_Yspec(1,1:5)))/(irr_ratio*1.28+(1-irr_ratio))*1.28;% plant density maize yield  (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
                FCo_3yieldarea(idd4(ii),32,yr,YSSP)=FCo_3yieldarea(idd4(ii),6,yr,YSSP).*(1+(max(1,(Soybean_HY(pro,2)/Cur_yield(pro,yr,YSSP)))-1)*sum(soybean_Yspec(1,1:4))/sum(soybean_Yspec(1,1:5)))/(irr_ratio*1.28+(1-irr_ratio))*1.28;% soil organic management maize yield  (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
                FCo_3yieldarea(idd4(ii),36,yr,YSSP)=FCo_3yieldarea(idd4(ii),6,yr,YSSP).*(1+(max(1,(Soybean_HY(pro,2)/Cur_yield(pro,yr,YSSP)))-1)*sum(soybean_Yspec(1,1:5))/sum(soybean_Yspec(1,1:5)))/(irr_ratio*1.28+(1-irr_ratio))*1.28;% cultivar maize yield  (Wang et al., 2021,Global irrigation contribution to wheat and maize yield)
            end
        end
    end
end




% display the triple rice scenarios
%% take the impact of climate impact on yield into consideration
load(strcat('output/Yield_ratio','.dat'),'-mat'); % zeros(167,4,102,3);% 167 countries (31 is for China), 4 crops, 102 years(1999-2100;1 is for 1999,2 is for 2000;3 is for 2001), 2 SSPs(SSP2.6 and SSP8.5)
for YSSP=1:3
    for yr=1:101
        Ratioto2020=Yield_ratio(31,1:4,yr+1,YSSP);% crop yield in year 2020
        FCo_3yieldarea_noclimate(:,3:6,yr,YSSP)=FCo_3yieldarea(:,3:6,yr,YSSP);% current yield
        FCo_3yieldarea_noclimate(:,13:16,yr,YSSP)=FCo_3yieldarea(:,13:16,yr,YSSP);% yield due to optimized fertilizer
        FCo_3yieldarea_noclimate(:,17:20,yr,YSSP)=FCo_3yieldarea(:,17:20,yr,YSSP);% yield due to optimized fertilizer, water
        FCo_3yieldarea_noclimate(:,21:24,yr,YSSP)=FCo_3yieldarea(:,21:24,yr,YSSP);% yield due to optimized fertilizer, water, planting date
        FCo_3yieldarea_noclimate(:,25:28,yr,YSSP)=FCo_3yieldarea(:,25:28,yr,YSSP);% yield due to optimized fertilizer, water, planting date,plant density
        FCo_3yieldarea_noclimate(:,29:32,yr,YSSP)=FCo_3yieldarea(:,29:32,yr,YSSP);% yield due to optimized fertilizer, water, planting date,plant density,soil organic management
        FCo_3yieldarea_noclimate(:,33:36,yr,YSSP)=FCo_3yieldarea(:,33:36,yr,YSSP);% yield due to optimized fertilizer, water, planting date,plant density,soil organic management, and cultivar
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        FCo_3yieldarea_noclimate(:,37:40,yr,YSSP)=FCo_3yieldarea(:,7:10,yr,YSSP);% current area
        FCo_3yieldarea_noclimate(:,41:44,yr,YSSP)=FCo_3yieldarea(:,33:36,yr,YSSP);% yield due to technological advance and muptiple cropping

        for az=1:2 % Rice, we consider rice Southeast, Southwest, is  from double to triple rice 
            idd2=find(Co_agroecological_zones(:,4)==az);% Rice
            FCo_3yieldarea_noclimate(idd2,38,yr,YSSP)=FCo_3yieldarea(idd2,8,yr,YSSP)/2*3;% rice area
            FCo_3yieldarea_noclimate(idd2,42,yr,YSSP)=FCo_3yieldarea(idd2,34,yr,YSSP)*0.85;% from double to triple rice yield due to technological advance and full irrigation*Ytriple/Ydoule
        end
        
        Ratioto2020=Yield_ratio(31,1:4,yr+1,YSSP);% crop yield in year 2020
        FCo_3yieldarea(:,3:6,yr,YSSP)=FCo_3yieldarea(:,3:6,yr,YSSP).*Ratioto2020;% current yield
        FCo_3yieldarea(:,13:16,yr,YSSP)=FCo_3yieldarea(:,13:16,yr,YSSP).*Ratioto2020;% yield due to optimized fertilizer
        FCo_3yieldarea(:,17:20,yr,YSSP)=FCo_3yieldarea(:,17:20,yr,YSSP).*Ratioto2020;% yield due to optimized fertilizer, water
        FCo_3yieldarea(:,21:24,yr,YSSP)=FCo_3yieldarea(:,21:24,yr,YSSP).*Ratioto2020;% yield due to optimized fertilizer, water, planting date
        FCo_3yieldarea(:,25:28,yr,YSSP)=FCo_3yieldarea(:,25:28,yr,YSSP).*Ratioto2020;% yield due to optimized fertilizer, water, planting date,plant density
        FCo_3yieldarea(:,29:32,yr,YSSP)=FCo_3yieldarea(:,29:32,yr,YSSP).*Ratioto2020;% yield due to optimized fertilizer, water, planting date,plant density,soil organic management
        FCo_3yieldarea(:,33:36,yr,YSSP)=FCo_3yieldarea(:,33:36,yr,YSSP).*Ratioto2020;% yield due to optimized fertilizer, water, planting date,plant density,soil organic management, and cultivar
        
        FCo_3yieldarea(:,37:40,yr,YSSP)=FCo_3yieldarea(:,7:10,yr,YSSP);% current area
        FCo_3yieldarea(:,41:44,yr,YSSP)=FCo_3yieldarea(:,33:36,yr,YSSP);% yield due to technological advance and muptiple cropping

        for az=1:2 % Rice, we consider rice Southeast, Southwest, is  from double to triple rice 
            idd2=find(Co_agroecological_zones(:,4)==az);% Rice
            FCo_3yieldarea(idd2,38,yr,YSSP)=FCo_3yieldarea(idd2,8,yr,YSSP)/2*3;% rice area
            FCo_3yieldarea(idd2,42,yr,YSSP)=FCo_3yieldarea(idd2,34,yr,YSSP)*0.85;% from double to triple rice yield due to technological advance and full irrigation*Ytriple/Ydoule
        end
    end
end

save('output\IrrWater_par.dat','IrrWater_par','-v7.3');% 1:province ID;2:irrigation water area (ha);3:5:planting area of maize, rice and wheat.;6:irrigation ratio;7:9:(m3/ha) irrigation water m3 per ha
save('output\FCo_3yieldarea.dat','FCo_3yieldarea','-v7.3');% 1:2836 COID;2:34 ProID;3:5 yield of maize,rice and wheat;6:8:area of maize,rice and wheat;9:% sum of land in each country;10:farm scale.

