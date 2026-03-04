# Hamsterpit

A small tool for running an agent in a container with a narrow view of
your project, delimited by a filesystem subtree.

To run, give it the paths of the subtrees you want the agent to see:

    $ hamsterpit run /path/to/project1 /path/to/project2 ...

and then inside the container, start the agent:

    # claude

Next, just follow the agent CLI instructions on how to authenticate
and start working.

If you want to start with an empty working directory, just run

    $ hamsterpit run

The tool works via mapped directories. The given subtree is mapped to
the `/workspace` inside the container and the agent does not see
anything outside of that. In the example above, the directory
`/path/to/project1` will be located at `/workspace/project1` inside
the container, and `/path/to/project2` - at `/workspace/project2`.

The agent config/state directories (`.claude`, `.gemini`) will be
automatically created at the location from which the `hamsterpit run`
is executed.
