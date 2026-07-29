import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformations.MeasureSpace

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformations

structure InvariantSet (X : MeasureSpace) (T : DynamicalSystem X) : Set X.carrier where
  carrierSet : Set X.carrier
  measurable : carrierSet ∈ X.sigmaAlgebra
  invariant : ∀ n, T.evolution n '' carrierSet = carrierSet

structure Ergodicity (X : MeasureSpace) (T : DynamicalSystem X) : Prop where
  trivialInvariantSets : ∀ (E : InvariantSet X T), X.measure E.carrierSet = 0 ∨ X.measure E.carrierSet = X.measure (Set.univ : Set X.carrier)

structure ErgodicTheoremData (X : MeasureSpace) (T : DynamicalSystem X) where
  f : X.carrier → ℝ
  integrable : True -- placeholder
  timeAverages : ℕ → ℝ
  timeAveragesDefined : ∀ N, timeAverages N = (1 / (N : ℝ)) * ∑ n in Finset.range N, f (T.evolution n x)
  almostEverywhereConvergence : ∀ᵐ x ∂ X.measure, ∃ (fbar : ℝ), Filter.Tendsto (λ N : ℕ => timeAverages N) Filter.atTop (𝓝 fbar)
  spaceAverageEqualsTimeAverage : ∀ᵐ x ∂ X.measure, (lim_{N→∞} timeAverages N) = (1 / X.measure (Set.univ : Set X.carrier)) * ∫ x, f x ∂ X.measure

end DynamicalAspectsMeasurePreservingTransformations
end HautevilleHouse