komsu = 9;
esikDeger = 0.8;

[egitimVerisi, testVerisi, egitimSinifVerisi, testSinifVerisi] = getDataset();

[sezgiselHata,enIyiAgirliklar] = lrfdb_coa(egitimVerisi, testVerisi, egitimSinifVerisi, testSinifVerisi, komsu);

fprintf("Boyut azaltma öncesi sezgisel hata: %f\n", sezgiselHata);

cikarilacakNitelikler = [];

for i=1: length(enIyiAgirliklar)
    if enIyiAgirliklar(i) < esikDeger
        cikarilacakNitelikler = [cikarilacakNitelikler, i];
    end
end


azaltilmisEgitimSeti = egitimVerisi;
azaltilmisEgitimSeti(:, cikarilacakNitelikler) = [];
azaltilmisTestSeti = testVerisi;
azaltilmisTestSeti(:, cikarilacakNitelikler) = [];

[azaltilmisSezgiselHata, azaltilmisEnIyiAgirliklar] = lrfdb_coa(azaltilmisEgitimSeti, azaltilmisTestSeti, egitimSinifVerisi, testSinifVerisi, komsu);

fprintf("Çıkarılan Nitelik Sayısı : %d\n",length(cikarilacakNitelikler));
fprintf("Boyut azaltma sonrası sezgisel hata: %f\n", azaltilmisSezgiselHata);

