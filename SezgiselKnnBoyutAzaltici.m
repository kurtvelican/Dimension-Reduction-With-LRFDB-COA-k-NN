function SezgiselKnnBoyutAzaltici(iterasyon, komsu_sayisi)

dataTable = zeros(11,8);

[boyutuAzaltilmisListe,sezgiselHatalar] = run(iterasyon, komsu_sayisi);

for j=1 : 8
    toplam = 0;
    cikarilanOzellikList = [];
    knnHata = [];
    sezgiselKnnHata = [];
    for k=1 : iterasyon
        toplam = toplam + boyutuAzaltilmisListe{k}(1,j);
        cikarilanOzellikList = [cikarilanOzellikList,boyutuAzaltilmisListe{k}(1,j)];
        knnHata = [knnHata, boyutuAzaltilmisListe{k}(2,j)];
        sezgiselKnnHata = [sezgiselKnnHata, boyutuAzaltilmisListe{k}(3,j)];

    end
    dataTable(1,j) = toplam/iterasyon;
    dataTable(2,j) = median(cikarilanOzellikList);
    dataTable(3,j) = std(cikarilanOzellikList);
    dataTable(4,j) = min(knnHata) * 100;
    dataTable(5,j) = max(knnHata) * 100;
    dataTable(6,j) = (sum(knnHata)/iterasyon) * 100;
    dataTable(7,j) = std(knnHata) * 100;
    dataTable(8,j) = min(sezgiselKnnHata) * 100;
    dataTable(9,j) = max(sezgiselKnnHata) * 100;
    dataTable(10,j) = (sum(sezgiselKnnHata)/iterasyon) * 100;
    dataTable(11,j) = std(sezgiselKnnHata) * 100;
end
result = array2table(dataTable);
writetable(result, "resultDataTable.xlsx");

enIyiSezgiselHata = min(sezgiselHatalar) * 100;
enKotuSezgiselHata = max(sezgiselHatalar) * 100;
ortalamaSezgiselHata = (sum(sezgiselHatalar)/iterasyon) * 100;
stdSezgiselHata = std(sezgiselHatalar) * 100;

fprintf("En iyi sezgisel hata = %.f\n",enIyiSezgiselHata);
fprintf("En kotu sezgisel hata = %.f\n",enKotuSezgiselHata);
fprintf("Ortalama sezgisel hata = %.f\n",ortalamaSezgiselHata);
fprintf("Standart Sapma Sezgisel Hata = %.f\n",stdSezgiselHata);
end


