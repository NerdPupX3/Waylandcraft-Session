# Waylandcraft Session

## ***"I use Minecraft btw"***

## Important, this software is not meant to compete or take away from the original project, this is only made for people who want Waylandcraft as a full session. All credit is due to the original creator for making this amazing mod.

Hi! This software is essentially a stripped down **labwc** configuration in which you boot directly into **prism launcher**, first configuring your internet so you can log in using **wlcontrol**, and then enter a pre-configured minecraft instance with either **Waylandcraft** or **Waylandcraft-extended** installed, to use as essentially it's own WM.

It's important to note this is made for arch and arch-based distros, minus any atomic release. Support for other distros will come later.

### Little story of the project:

 This project came from the love that I have for nerdy linux things, and my favorite minecraft mod and it's fork, called Waylandcraft and Waylandcraft-extended. For a year now, I have dreamt of creating a rice or a session where you were in a videogame and your windows and settings were around you in the videogame. I found that idea super cool. But I didn't believe it was possible until I found these mods. And then I dreamt of being able to turn it into a session. But it wasn't until I used **labwc** that I found a way to do that. This is my first open source dev project, so I hope y'all like it!

### And now back to the project:

For this project, I'm creating a pre-configured **labwc** session with only the bindings needed to use it as a conduit for **Waylandcraft**. It's important to note, **labwc** is only meant as a conduit to turn **Waylandcraft** into a session, as the actual WM stuff is supposed to be done inside it.

The bindings for **labwc** are: "Super+q" to quit, and "Super+r" to reconfigure.

The project comes with a .desktop file, which executes the start script for **labwc**, so that it uses the config file already pre-configured and opens **wlcontrol** and **prism-launcher**.

The repository comes with a install script for easy installation, which automatically installs the packages needed, configures everything, and lastly lets you choose between **Waylandcraft** and **Waylandcraft-Extended**.

* Choose **Waylandcraft original** if you want to support the original creator and want a software created without any use of AI, at the cost of less fearures.
* Choose **Waylandcraft Extended** if you want a WM with support for xwayland built in, capacity to change bindings, optimizations for gaming, and workspaces, but with the use of AI in it's creation.

So that's about it, thank you for considering using my scripts. You can also find this in the ***AUR*** by the name of ***waylandcraft-session***. Have a good day!
