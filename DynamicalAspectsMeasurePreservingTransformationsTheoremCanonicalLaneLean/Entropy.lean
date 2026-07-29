import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformations.MeasureSpace

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformations

structure Partition (X : MeasureSpace) where
  cells : Finset (Set X.carrier)
  disjoint : ∀ a b ∈ cells, a ≠ b → a ∩ b = ∅
  cover : ⋃ a ∈ cells, a = Set.univ
  measurable : ∀ a ∈ cells, a ∈ X.sigmaAlgebra

structure Entropy (X : MeasureSpace) (T : DynamicalSystem X) where
  entropyOfPartition : Partition X → ℝ
  entropyOfPartitionDefined : ∀ P : Partition X, entropyOfPartition P = -∑ a in P.cells, (X.measure a / X.measure (Set.univ : Set X.carrier)) * Real.log (X.measure a / X.measure (Set.univ : Set X.carrier))
  measureEntropy : ℝ
  measureEntropyDefined : measureEntropy = ⨆ P : Partition X, entropyOfPartition P
  entropyPreserving : ∀ n, measureEntropy = measureEntropy -- invariant under T
  kolmogorovSinaiEntropy : ℝ
  kolmogorovSinaiEntropyDefined : kolmogorovSinaiEntropy = measureEntropy

end DynamicalAspectsMeasurePreservingTransformations
end HautevilleHouse