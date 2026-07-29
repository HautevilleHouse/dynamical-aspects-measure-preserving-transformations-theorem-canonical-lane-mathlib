import DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

structure PoincareRecurrencePackage where
  measureSpace : Type u
  measure : MeasureTheory.Measure measureSpace
  transformation : measureSpace → measureSpace
  measurePreserving : Prop
  recurrenceSet : Set measureSpace
  recurrenceTheorem : Prop
  measurePreservingClosed : measurePreserving
  recurrenceTheoremClosed : recurrenceTheorem

def PoincareRecurrenceClosed (P : PoincareRecurrencePackage) : Prop :=
  P.measurePreserving ∧ P.recurrenceTheorem

theorem poincare_recurrence_closed (P : PoincareRecurrencePackage) : PoincareRecurrenceClosed P := by
  exact And.intro P.measurePreservingClosed P.recurrenceTheoremClosed

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse
