import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean.MeasurePreservingStructure

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

structure ErgodicTheorem (M : MeasurePreservingStructure) where
  spaceAverage : Type u
  timeAverage : spaceAverage → spaceAverage
  almostEverywhereConvergence : Prop
  equalityOfAverages : Prop

structure ErgodicEvidence {M : MeasurePreservingStructure} (E : ErgodicTheorem M) where
  almostEverywhereConvergenceClosed : E.almostEverywhereConvergence
  equalityOfAveragesClosed : E.equalityOfAverages

def ErgodicClosed {M : MeasurePreservingStructure} (E : ErgodicTheorem M) : Prop :=
  E.almostEverywhereConvergence ∧ E.equalityOfAverages

theorem ergodic_closed_from_evidence {M : MeasurePreservingStructure} (E : ErgodicTheorem M)
    (Ev : ErgodicEvidence E) : ErgodicClosed E := by
  exact And.intro Ev.almostEverywhereConvergenceClosed Ev.equalityOfAveragesClosed

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse
