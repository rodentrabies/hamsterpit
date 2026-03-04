# Hamsterpit

A small tool for running an agent in a container with a narrow view of
your project, delimited by a filesystem subtree.

To run, give it the path to subtree you want the agent to see:

    $ hamsterpit run /path/to/your/project/subdirectory

and then inside the container, start the agent:

    # claude

Next, just follow the agent CLI instructions on how to authenticate
and start working.

The tool works via mapped directories. The given subtree is mapped to
the `/workspace` inside the container and the agent does not see
anything outside of that.

The agent config/state directories (`.claude`, `.gemini`) will be
automatically created at the location from which the `hamsterpit run`
is executed.
