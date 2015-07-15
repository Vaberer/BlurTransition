# BlurTransition
![Font Awesome Swift](https://github.com/Vaberer/Font-Awesome-Swift/blob/master/resources/opensource_matters.png)

Follow me: [@vaberer](https://twitter.com/vaberer)

I like &#9733;. Do not forget to &#9733; this project.

Demonstrating UIVisualEffects created via Storyboard and custom transitions


<p align="center">
  <img height="480" src="https://github.com/Vaberer/BlurTransition/blob/master/demo.gif" />
</p>

<h2>Blur Effects</h2>
Demonstrating of using UIVisualEffect to achieve Vibrancy & Blur effect in FirstVC Controller. 
Demonstrating of using UIVisualEffect to achieve Vibrancy effect in SecondVC Controller. 

All UI Elements are made only in Storyboard. Works for all devices and Landscape mode

<h2>Custom Transitions</h2>


Custom Transitions do not use frames to move elements but only CONSTRAINTS**. Solution for projects which use constraints, so it works in landscape mode without any issues, too.

For Navigation custom transitions, impelemnt in FirstVC <code>UINavigationControllerDelegate, UIViewControllerTransitioningDelegate</code> protocols.
Custom Objects for Transitions are <code>PushAnimator, PopAnimator</code> and for modal transition <code>ModalAnimator</code>.

<h2>Author</h2>

Patrik Vaberer, patrik.vaberer@gmail.com<br/>
<a target="_blank" href="https://sk.linkedin.com/in/vaberer">LinkedIn</a><br>
<a target="_blank" href="http://vaberer.me">Blog</a>


<h2>Licence</h2>

BlurTransition is available under the MIT license. See the LICENSE file for more info.
