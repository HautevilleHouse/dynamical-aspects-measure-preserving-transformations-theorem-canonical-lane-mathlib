import canonicalLaneMathlib.AdmissibleClass
import DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean.MeasurePreservingTransformations

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

structure MeasureEntropy (X : Type u) (D : DynamicalSystem X) where
  entropyValue : ℝ
  kolmogorovSinaiEntropy : Prop
  entropyPositive : entropyValue > 0

structure InvariantMeasurePackage (X : Type u) (D : DynamicalSystem X) where
  invariantMeasures : Set (DynamicalSystem X)
  ergodicDecompositionInvariant : Prop

structure EntropyEvidence (X : Type u) (D : DynamicalSystem X) (M : MeasureEntropy X D) where
  kolmogorovSinaiEntropyClosed : M.kolmogorovSinaiEntropy
  entropyPositiveClosed : M.entropyPositive

def EntropyClosed (X : Type u) (D : DynamicalSystem X) (M : MeasureEntropy X D) : Prop :=
  M.kolmogorovSinaiEntropy ∧ M.entropyPositive

theorem entropy_closed_from_evidence (X : Type u) (D : DynamicalSystem X) (M : MeasureEntropy X D) (Ev : EntropyEvidence X D M) :
  EntropyClosed X D M := by
  exact And.intro Ev.kolmogorovSinaiEntropyClosed Ev.entropyPositiveClosed

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse