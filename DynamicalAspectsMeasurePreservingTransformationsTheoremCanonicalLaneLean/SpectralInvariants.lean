import DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

structure SpectralInvariantsPackage where
  measureSpace : Type u
  measure : MeasureTheory.Measure measureSpace
  transformation : measureSpace → measureSpace
  unitaryOperator : Transformation → HilbertSpace
  spectrum : Set Complex
  spectralMeasure : SpectralMeasure
  spectralTheoremStatement : Prop
  operatorConstructed : unitaryOperator =...
  spectrumClosed : spectrum
  spectralMeasureClosed : spectralMeasure
  spectralTheoremClosed : spectralTheoremStatement

def SpectralInvariantsClosed (S : SpectralInvariantsPackage) : Prop :=
  S.spectrumClosed ∧ S.spectralMeasureClosed ∧ S.spectralTheoremClosed

theorem spectral_invariants_closed (S : SpectralInvariantsPackage) : SpectralInvariantsClosed S := by
  exact And.intro S.spectrumClosed (And.intro S.spectralMeasureClosed S.spectralTheoremClosed)

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse
