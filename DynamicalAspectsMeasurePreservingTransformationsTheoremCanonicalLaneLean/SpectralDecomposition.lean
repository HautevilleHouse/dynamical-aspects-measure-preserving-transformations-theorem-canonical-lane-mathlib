import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean.KoopmanOperator

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

structure SpectralDecomposition (M : MeasurePreservingStructure) where
  spectrum : Type u
  eigenfunctions : Type v
  spectralTheorem : Prop
  sumDecomposition : Prop

structure SpectralEvidence {M : MeasurePreservingStructure} (S : SpectralDecomposition M) where
  spectralTheoremClosed : S.spectralTheorem
  sumDecompositionClosed : S.sumDecomposition

def SpectralClosed {M : MeasurePreservingStructure} (S : SpectralDecomposition M) : Prop :=
  S.spectralTheorem ∧ S.sumDecomposition

theorem spectral_closed_from_evidence {M : MeasurePreservingStructure} (S : SpectralDecomposition M)
    (E : SpectralEvidence S) : SpectralClosed S := by
  exact And.intro E.spectralTheoremClosed E.sumDecompositionClosed

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse
