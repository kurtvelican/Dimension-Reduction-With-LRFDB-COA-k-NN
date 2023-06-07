function [boyutuAzaltilmisListe,sezgiselHatalar] = run(iterasyon, komsu_sayisi)

sezgiselHatalar = zeros(iterasyon,1);
boyutuAzaltilmisListe = repmat({},iterasyon);
[egitimVerisi, testVerisi, egitimSinifVerisi, testSinifVerisi] = getDataset();

for i=1 : iterasyon

    [sezgiselHata,enIyiAgirliklar] = lrfdb_coa(egitimVerisi, testVerisi, egitimSinifVerisi, testSinifVerisi, komsu_sayisi);
    sezgiselHatalar(i) = sezgiselHata;
    hataListesi = zeros(3,8);

    for j = 1 : 8
        cikarilacakNitelikler = [];
        for k=1:length(enIyiAgirliklar)
            if enIyiAgirliklar(k) < (j/10) %Eşik değer - 0.1 den 0.8 e
                cikarilacakNitelikler = [cikarilacakNitelikler, k];
            end
        end

        azaltilmisEgitimSeti = egitimVerisi;
        azaltilmisEgitimSeti(:, cikarilacakNitelikler) = [];
        azaltilmisTestSeti = testVerisi;
        azaltilmisTestSeti(:, cikarilacakNitelikler) = [];
        
        knnHata = knnFunc(ones(1,size(azaltilmisEgitimSeti,2)),azaltilmisEgitimSeti,azaltilmisTestSeti, egitimSinifVerisi, testSinifVerisi, komsu_sayisi);
        
        hataListesi(1, j) = length(cikarilacakNitelikler);
        hataListesi(2, j) = knnHata;
        [azaltilmisSezgiselHata, azaltilmisEnIyiAgirliklar] = lrfdb_coa(azaltilmisEgitimSeti, azaltilmisTestSeti, egitimSinifVerisi, testSinifVerisi, komsu_sayisi);
        hataListesi(3, j) = azaltilmisSezgiselHata;
    end
    boyutuAzaltilmisListe{i} = hataListesi;
    fprintf("%d. iterasyon tamamlandı.\n",  i);
end