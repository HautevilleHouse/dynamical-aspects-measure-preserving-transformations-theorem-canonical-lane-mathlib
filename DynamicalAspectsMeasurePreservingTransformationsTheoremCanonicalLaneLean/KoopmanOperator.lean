import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean.MeasurePreservingStructure

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

structure KoopmanOperator (M : MeasurePreservingStructure) where
  functionSpace : Type u
  operator : functionSpace → functionSpace
  linearity : Prop
  isometry : Prop
  spectralStructure : Prop

structure KoopmanEvidence {M : MeasurePreservingStructure} (K : KoopmanOperator M) where
  linearityClosed : K.linearity
  isometryClosed : K.isometry
  spectralStructureClosed : K.spectralStructure

def KoopmanClosed {M : MeasurePreservingStructure} (K : KoopmanOperator M) : Prop :=
  K.linearity ∧ K.isometry ∧ K.spectralStructure

theorem koopman_closed_from_evidence {M : MeasurePreservingStructure} (K : KoopmanOperator M)
    (E : KoopmanEvidence K) : KoopmanClosed K := by
  exact And.intro E.linearityClosed (And.intro E.isometryClosed E.spectralStructureClosed)

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse
