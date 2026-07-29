import canonicalLaneMathlib.AdmissibleClass
import DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean.MeasurePreservingTransformations

/-!
# Ergodic and Mixing Bridge Lemmas

This module provides the bridge closure for the ergodic and mixing properties
of measure-preserving transformations, following the canonical linear lane pattern.
-/

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DynamicalBridge (X : MeasureSpace) (T : MeasurePreservingTransformation X) where
  ergodicClosed : (ErgodicProperties X T).ergodic
  mixingClosed : (MixingProperties X T).strongMixing
  bridgeProof : ergodicClosed ∧ mixingClosed

theorem bridge_from_admissible_class (A : DynamicalAdmissibleClass) : DynamicalBridge A.object.transformation := by
  have h : A.object.ergodic.ergodic ∧ A.object.mixing.strongMixing := A.object.conclusion
  exact { ergodicClosed := h.1, mixingClosed := h.2, bridgeProof := h }

end DynamicalAspectsMeasurePreservingTransformationsTheoremCanonicalLaneLean
end HautevilleHouse
