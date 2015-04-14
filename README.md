# BlurTransition
Demonstrating UIVisualEffects crated via Storyboard and custom transitions


<p align="center">
  <img src="https://github.com/Vaberer/BlurTransition/blob/master/demo.gif" />
</p>

<h2>Blur Effects</h2>
Demonstrating of using UIVisualEffect to achieve Vibrancy & Blur effect in FirstVC Controller. 
Demonstrating of using UIVisualEffect to achieve Vibrancy effect in SecondVC Controller. 

All UI Elements are made only in Storyboard. Works for all devices and Landscape mode

<h2>Custom Transitions</h2>


Custom Transitions do not use frames to move elements but only **CONSTRAINTS**. Solution for projects which use constraints, so it works in landscape mode without any problems, too.

For Navigation custom transitions, impelemnt in FirstVC <code>UINavigationControllerDelegate, UIViewControllerTransitioningDelegate</code> protocols.
Custom Objects for Transitions are <code>PushAnimator, PopAnimator</code> and for modal transition <code>ModalAnimator</code.

