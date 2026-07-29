import canonicalLaneMathlib.AdmissibleClass
import DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean.MeasurePreservingTransformations

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

structure KoopmanOperator (X : Type u) (D : DynamicalSystem X) where
  operator : (X → ℂ) → (X → ℂ)
  unitary : Prop
  spectralMeasure : Type v
  spectralMeasureDefined : Prop

structure SpectralPackage (X : Type u) (D : DynamicalSystem X) (K : KoopmanOperator X D) where
  discreteSpectrum : Prop
  continuousSpectrum : Prop
  mixingSpectrumRelation : Prop

structure SpectralEvidence {X : Type u} {D : DynamicalSystem X} {K : KoopmanOperator X D} (S : SpectralPackage X D K) where
  discreteSpectrumClosed : S.discreteSpectrum
  continuousSpectrumClosed : S.continuousSpectrum
  mixingSpectrumRelationClosed : S.mixingSpectrumRelation

def SpectralClosed {X : Type u} {D : DynamicalSystem X} {K : KoopmanOperator X D} (S : SpectralPackage X D K) : Prop :=
  S.discreteSpectrum ∧ S.continuousSpectrum ∧ S.mixingSpectrumRelation

theorem spectral_closed_from_evidence {X : Type u} {D : DynamicalSystem X} {K : KoopmanOperator X D} (S : SpectralPackage X D K) (Ev : SpectralEvidence S) :
  SpectralClosed S := by
  exact And.intro Ev.discreteSpectrumClosed (And.intro Ev.continuousSpectrumClosed Ev.mixingSpectrumRelationClosed)

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse