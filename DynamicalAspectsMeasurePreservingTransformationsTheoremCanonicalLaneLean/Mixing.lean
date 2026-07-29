import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformations.MeasureSpace

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformations

structure MixingCondition (X : MeasureSpace) (T : DynamicalSystem X) : Prop where
  strongMixing : ∀ A B ∈ X.sigmaAlgebra, Filter.Tendsto (λ n : ℕ => X.measure (T.evolution n '' A ∩ B)) Filter.atTop (𝓝 (X.measure A * X.measure B))
  weakMixing : ∀ A B ∈ X.sigmaAlgebra, (1/N) * ∑ n in Finset.range N, |X.measure (T.evolution n '' A ∩ B) - X.measure A * X.measure B| → 0 as N → ∞

structure SpectralMeasure (X : MeasureSpace) (T : DynamicalSystem X) where
  unitaryOperator : HilbertSpace X.carrier → HilbertSpace X.carrier
  spectralMeasure : Set ℝ → ProjectionValuedMeasure
  mixingViaSpectrum : MixingCondition X T ↔ spectralMeasure hasContinuousSpectrum

theorem mixing_implies_ergodic (X : MeasureSpace) (T : DynamicalSystem X) (hMixing : MixingCondition X T) : Ergodicity X T := by
  intro E
  sorry

end DynamicalAspectsMeasurePreservingTransformations
end HautevilleHouse