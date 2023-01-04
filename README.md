# IdenticalNavigationLinkValuesBug_iOS16.2

When there are two identical NavigationLinks - NavigationLinks with the same value - within the same navigation stack but on different screens, and one of them is active, and the other one is displayed on screen, then the latter one shows a list selection highlight even though it's not actually active.

In the sample project, tap through the NavigationLinks to push screens on the stack. You may push Entry A and Recipe B, and then observe that the next NavigationLink to push another copy of Entry A onto the stack will show a list selection highlight.