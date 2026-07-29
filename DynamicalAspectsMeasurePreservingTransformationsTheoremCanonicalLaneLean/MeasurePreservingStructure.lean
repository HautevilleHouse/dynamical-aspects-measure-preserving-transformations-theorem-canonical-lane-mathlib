import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

structure MeasurePreservingStructure where
  space : Type u
  sigmaAlgebra : Set (Set space)
  measure : space → ℝ
  dynamics : space → space
  invariantMeasure : Prop
  ergodic : Prop
  mixing : Prop

structure MeasurePreservingEvidence (M : MeasurePreservingStructure) where
  invariantMeasureClosed : M.invariantMeasure
  ergodicClosed : M.ergodic
  mixingClosed : M.mixing

def MeasurePreservingClosed (M : MeasurePreservingStructure) : Prop :=
  M.invariantMeasure ∧ M.ergodic ∧ M.mixing

theorem measure_preserving_closed_from_evidence (M : MeasurePreservingStructure)
    (E : MeasurePreservingEvidence M) : MeasurePreservingClosed M := by
  exact And.intro E.invariantMeasureClosed (And.intro E.ergodicClosed E.mixingClosed)

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse
