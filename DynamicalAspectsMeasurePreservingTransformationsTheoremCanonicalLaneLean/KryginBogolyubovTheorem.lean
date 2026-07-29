import DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

structure KryginBogolyubovPackage where
  dynamicalSystem : Type u
  invariantMeasure : Type v
  existenceOfInvariantMeasure : Prop
  compactnessCondition : Prop
  continuityCondition : Prop
  existenceClosed : existenceOfInvariantMeasure
  compactnessClosed : compactnessCondition
  continuityClosed : continuityCondition

def KryginBogolyubovClosed (P : KryginBogolyubovPackage) : Prop :=
  P.existenceOfInvariantMeasure ∧ P.compactnessCondition ∧ P.continuityCondition

theorem krygin_bogolyubov_closed (P : KryginBogolyubovPackage) : KryginBogolyubovClosed P := by
  exact And.intro P.existenceClosed (And.intro P.compactnessClosed P.continuityClosed)

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse
