import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformations

structure MeasureSpace where
  carrier : Type u
  sigmaAlgebra : Set (Set carrier)
  measure : Set carrier → ℝ
  measureNonnegative : ∀ s, measure s ≥ 0
  measureEmpty : measure ∅ = 0
  measureCountablyAdditive : ∀ (f : ℕ → Set carrier), (∀ i j, i ≠ j → f i ∩ f j = ∅) → measure (⋃ i, f i) = ∑' i, measure (f i)
  measureSpaceTopology : TopologicalSpace carrier
  borelMeasurable : sigmaAlgebra = borel carrier

structure MeasurePreservingMap (X Y : MeasureSpace) where
  map : X.carrier → Y.carrier
  measurable : ∀ s ∈ Y.sigmaAlgebra, map⁻¹' s ∈ X.sigmaAlgebra
  measurePreserving : ∀ s ∈ Y.sigmaAlgebra, X.measure (map⁻¹' s) = Y.measure s

structure DynamicalSystem (X : MeasureSpace) where
  time : ℕ
  evolution : ℕ → (X.carrier → X.carrier)
  semigroup : ∀ n m, evolution (n + m) = evolution n ∘ evolution m
  identityAtZero : evolution 0 = id
  measurableEach : ∀ n, ∀ s ∈ X.sigmaAlgebra, (evolution n)⁻¹' s ∈ X.sigmaAlgebra
  measurePreservingEach : ∀ n, ∀ s ∈ X.sigmaAlgebra, X.measure ((evolution n)⁻¹' s) = X.measure s

end DynamicalAspectsMeasurePreservingTransformations
end HautevilleHouse