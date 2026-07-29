import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : MeasurePreservingAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MeasurePreservingWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse
