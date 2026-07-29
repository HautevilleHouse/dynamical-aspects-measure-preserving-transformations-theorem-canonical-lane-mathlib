import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

structure KhinchinLiftingPackage (X : Type u) [MeasurableSpace X] (D : DynamicalSystem X) where
  uniformApproximation : Prop
  convergentSubsequence : Prop
  liftingPreservesMeasure : Prop

structure KhinchinLiftingEvidence (X : Type u) [MeasurableSpace X] {D : DynamicalSystem X} (K : KhinchinLiftingPackage X D) where
  uniformApproximationClosed : K.uniformApproximation
  convergentSubsequenceClosed : K.convergentSubsequence
  liftingPreservesMeasureClosed : K.liftingPreservesMeasure

def KhinchinLiftingClosed (X : Type u) [MeasurableSpace X] {D : DynamicalSystem X} (K : KhinchinLiftingPackage X D) : Prop :=
  K.uniformApproximation ∧ K.convergentSubsequence ∧ K.liftingPreservesMeasure

theorem khinchin_lifting_closed_from_evidence (X : Type u) [MeasurableSpace X] {D : DynamicalSystem X} (K : KhinchinLiftingPackage X D) (Ev : KhinchinLiftingEvidence X D K) : KhinchinLiftingClosed X D K := by
  exact And.intro Ev.uniformApproximationClosed (And.intro Ev.convergentSubsequenceClosed Ev.liftingPreservesMeasureClosed)

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse