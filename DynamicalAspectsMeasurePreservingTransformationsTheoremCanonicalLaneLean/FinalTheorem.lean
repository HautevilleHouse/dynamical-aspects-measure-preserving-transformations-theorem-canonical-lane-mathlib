import canonicalLaneMathlib.AdmissibleClass
import DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean.ErgodicMixingBridge

/-!
# Final Theorem: Constrained Dynamical Closure

This module defines the constrained closure for the Dynamical Aspects Measure-Preserving
Transformations Theorem and provides the endgame proof.
-/

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

def bridgeClosed (A : DynamicalAdmissibleClass) : Prop :=
  let bridge := bridge_from_admissible_class A
  bridge.bridgeProof
theorem bridge_from_admissible_class_prop (A : DynamicalAdmissibleClass) : bridgeClosed A :=
  (bridge_from_admissible_class A).bridgeProof

def gateClosed (A : DynamicalAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : DynamicalAdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedDynamicalClosure (A : DynamicalAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dynamical_endgame (A : DynamicalAdmissibleClass) : ConstrainedDynamicalClosure A :=
  And.intro (bridge_from_admissible_class_prop A) (gate_from_admissible_class A)

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse
