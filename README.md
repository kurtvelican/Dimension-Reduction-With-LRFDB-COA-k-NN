# Dimension Reduction With LRFDB-COA-k-NN

Dimension reduction, which plays a critical role in extracting meaningful information from high-dimensional datasets, holds significant importance in the field of data mining. When working with increasingly large and complex datasets that bring challenges such as computation, hardware, and proper modeling, it is essential to determine the effects of fundamental attributes on the target parameter. Through dimension reduction, attributes that have insufficient impact on the target parameter can be removed from the dataset, resulting in a more comprehensible dataset. Dimension reduction techniques not only help overcome these challenges but also preserve important structures and relationships within the data, enabling the detection and correction of errors made during the modeling process. An optimized model with the fewest number of attributes provides acceptable classification performance. Therefore, dimension reduction studies require the use of metaheuristic search algorithms, considering the problem size and complexity.

Metaheuristic search algorithms encompass methods that perform probability-based but conscious searches in the solution space. These methods generate new solutions based on the solution set created at each step. By conducting searches near the global optimum points of the search space, which are close to the optimal solution, and escaping from local solution traps, they aim to reach the most suitable solution. The performance of metaheuristic search algorithms is problem-dependent, including in nature. While every living organism or process may exhibit flawless performance in its own functioning, it can be highly unsuccessful for another task or process. Additionally, modern metaheuristic search algorithms developed recently have relatively stable and successful search performance as they have been tested and developed on various types of optimization problems with different characteristics.

In addition to metaheuristic search algorithms, using the k-nearest neighbors (k-NN) classifier in dimension reduction methods contributes to the success of the dimension reduction approach. In this project, the COA (Coyote Optimization Algorithm) algorithm, specifically the LRFDB-COA (Lévy Roulette FDB-COA) algorithm, which is an improved version based on Lévy Flight and FBD, is utilized. This algorithm is combined with the k-NN classifier to create a hybrid algorithm. This hybrid algorithm is developed to have capabilities that respond to different requirements, such as weighting attributes specific to the problem and intuitive classification.

## k-nn Classifier

k-NN is an instance-based classification algorithm. The algorithm's foundation relies on referencing observations in the problem space, which represents the set of example observations with similar characteristics to the observation whose class is to be determined. The k-NN classifier does not involve a learning method or develop a model specific to the problem. Instead, it utilizes observations with similar features from the example observations representing the problem space to classify an observation.
Below are the steps of the k-NN algorithm:

Determining the value of k: One of the most important parameters of the k-NN algorithm is the value of k. k represents the number of neighbors and determines how many neighbors will be considered during classification. The value of k can be selected depending on the problem and dataset. It can be a predetermined value or determined through techniques such as cross-validation or optimization.

Distance measurement: In k-NN, similarity or distance between observations is calculated. Distance metrics like Euclidean, Manhattan, or Minkowski are commonly used. These metrics measure the differences between observations and serve as a measure of similarity.

Selecting the nearest neighbors: For each observation, the k nearest neighbors are selected based on the calculated distance values.

Classification: The observation is classified by considering the classes of the selected nearest neighbors. The majority voting method can be used, meaning the most frequent class label is selected through voting. Additionally, weighting factors can be applied to the neighbors, where weights are assigned based on their distances.

## Lévy Roulette FDB-COA Algorithm

The Coyote Optimization Algorithm (COA) is a population-based algorithm inspired by the Canis latrans species, also known as the coyote (Pierezan and Coelho, 2018). Unlike many other metaheuristic search algorithms, COA divides the population into subgroups and packs. Each pack consists of a specific number of coyotes and an alpha individual. The alpha represents the best coyote in a pack. Additionally, the COA algorithm focuses on sharing the social structures and behaviors of coyotes. Similar to other stochastic algorithms, the initial social status of coyotes is randomly determined within the population. COA calculates the cultural tendency of the pack based on information from coyotes and assumes that coyotes share their social statuses and are organized to contribute to the sustainability of the pack. In this study, an algorithm called LRFDB-COA (Lévy Roulette Fitness Distance Balance Coyote Optimization Algorithm) is used. This algorithm utilizes Levy flight and probabilistic FDB selection method to enhance the performance of COA. According to this approach, the cultural tendency of the pack can be represented by coyotes with social statuses that can contribute the most to the pack.

## Hybrid Algorithm Process

### Weighting of Features using LRFDB-COA-kNN Algorithm:
The intuitive k-nearest neighbors (kNN) algorithm is used to investigate the impact of features on the problem and weight them accordingly. For this purpose, the COA algorithm, an evolutionary metaheuristic search algorithm, is used in its improved version called LRFDB-COA, which incorporates FDB (Fitness Distance Balance) and Levy Flight. In the LRFDB-COA algorithm, the solution candidates are the weights assigned to the problem features. The solution candidates in the metaheuristic search algorithm are constrained to be between 0 and 1 (Lower and Upper Bounds). In other words, the ideal weights are sought between 0 and 1. The objective function is the intuitive kNN function. The classification error value returned by the objective function is examined to measure the fitness values of the weights or solution candidates. The search process aims to find the weights that minimize the classification error of the kNN algorithm. The search for ideal solution candidates continues until the termination criterion is met.

### Feature Selection / Dimension Reduction based on a Threshold Value:
After the search process for the optimal weights for features is completed in the LRFDB-COA algorithm, the dimension reduction or feature extraction phase of the problem is initiated. In this phase, a threshold value is used. Features with weights lower than the threshold value are removed.

### Performance Measurement of the Reduced-Dimension Model:
After the feature extraction process, the classification performance of the model is evaluated. The classification error values of the classical kNN algorithm and the intuitive kNN algorithms are compared. If the classification performance error values are lower than those of the model before feature extraction, indicating that the classification performance has not deteriorated or has even improved, then success has been achieved.

## Dimension Reduction Results

|Threshold| |0.1|0.2|0.3|0.4|0.5|0.6|0.7|0.8|
|:----|:----|:----|:----|:----|:----|:----|:----|:----|:----|
|Reduced Feature Count|Average|32,38|43,1|53,81|64,43|76,29|87,19|99,05|109,86|
| |Median|33|42|55|65|77|86|99|111|
| |Std.Deviation|10,14|8,58|7,68|7,17|5,51|5,27|6,38|7,56|
|k-nn|Best|47,02|44,05|41,07|39,88|26,19|26,19|27,38|26,79|
| |Worst|54,17|57,14|54,17|54,17|56,55|55,95|56,55|55,95|
| |Average|51,08|51,05|50,14|48,5|47,79|46,83|48,36|45,46|
| |Std.Deviation|1,9|2,93|3,36|3,91|6,44|6,87|7,27|8,09|
|LRFDB-COA- k-nn|Best|26,79|23,81|22,02|20,83|16,07|17,26|17,26|16,07|
| |Worst|44,64|47,02|42,26|41,07|39,29|39,29|43,45|33,33|
| |Average|38,15|34,81|32,54|30,33|27,24|25,31|25,14|23,19|
| |Std.Deviation|4,74|5,86|5,97|5,63|6,19|5,05|6,62|4,29|

![Chart Title2](https://github.com/kurtvelican/Dimension-Reduction-With-LRFDB-COA-k-NN/assets/55495821/0d1b4f37-fc42-487b-8763-8e0cc96b7897)


## Conclusion

In this project, the reduction of problem dimensionality through intuitive feature selection using LRFDB-COA-kNN algorithm and the changes in the classification performance of kNN and LRFDB-COA-kNN algorithms were investigated. The weighting of independent variables related to the problem and the removal of features with weights lower than a predetermined threshold value were achieved. The criterion for dimensionality reduction, or feature selection, was based on the performance of the kNN/intuitive kNN classifier, where the classification accuracy percentage should not deteriorate compared to the performance before dimensionality reduction. In other words, while reducing the number of independent variables in the problem, it was required that the classification algorithm's performance remains at least the same. As a result, the feature selection process conducted with the LRFDB-COA-kNN algorithm on the Urban Land Cover dataset was successfully completed. It was observed that the classification performance did not decrease, and in some datasets, it even improved after removing the features related to the problems. This indicates that the modeling phase for many problems was flawed, the independent variables were not optimally determined, and the problem models were insufficient in reflecting the behavior of the problem.




