import canonicalLaneMathlib.AdmissibleClass

/-!
# Measure-Preserving Transformations Package

This module defines the core structures for the Dynamical Aspects of Measure-Preserving
Transformations Theorem: a measure space, a measure-preserving transformation, and
the admissible-class bridge for the ergodic and mixing properties.
-/

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

structure MeasureSpace where
  carrier : Type u
  sigmaAlgebra : Set (Set carrier)
  measure : (Set carrier) → ℝ≥0∞

structure MeasurePreservingTransformation (X : MeasureSpace) where
  map : X.carrier → X.carrier
  measurable : ∀ s ∈ X.sigmaAlgebra, map⁻¹' s ∈ X.sigmaAlgebra
  measurePreserving : ∀ s ∈ X.sigmaAlgebra, X.measure (map⁻¹' s) = X.measure s

structure ErgodicProperties (X : MeasureSpace) (T : MeasurePreservingTransformation X) where
  invariantSetsTrivial : ∀ s ∈ X.sigmaAlgebra, (T.map⁻¹' s = s) → (X.measure s = 0 ∨ X.measure (X.carrier \ s) = 0)
  ergodic : Prop

structure MixingProperties (X : MeasureSpace) (T : MeasurePreservingTransformation X) where
  strongMixing : ∀ A B ∈ X.sigmaAlgebra, limit (λ n : ℕ => X.measure (T.map^[n] A ∩ B)) = (X.measure A) * (X.measure B)
  weakMixing : Prop

structure DynamicalAdmissibleObject (X : MeasureSpace) where
  transformation : MeasurePreservingTransformation X
  ergodic : ErgodicProperties X transformation
  mixing : MixingProperties X transformation
  conclusion : ergodic.ergodic ∧ mixing.strongMixing

structure DynamicalAdmissibleClass where
  object : DynamicalAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def DynamicalAdmittedClosure (A : DynamicalAdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse
