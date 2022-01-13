#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/murilo/edrom/src/vision/object_finder"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/murilo/edrom/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/murilo/edrom/install/lib/python3/dist-packages:/home/murilo/edrom/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/murilo/edrom/build" \
    "/usr/bin/python3" \
    "/home/murilo/edrom/src/vision/object_finder/setup.py" \
    egg_info --egg-base /home/murilo/edrom/build/vision/object_finder \
    build --build-base "/home/murilo/edrom/build/vision/object_finder" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/murilo/edrom/install" --install-scripts="/home/murilo/edrom/install/bin"
