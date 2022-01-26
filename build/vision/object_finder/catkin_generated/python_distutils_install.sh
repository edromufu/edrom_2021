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

echo_and_run cd "/home/gabriel-ubuntu/edrom_2021/src/vision/object_finder"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/gabriel-ubuntu/edrom_2021/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/gabriel-ubuntu/edrom_2021/install/lib/python3/dist-packages:/home/gabriel-ubuntu/edrom_2021/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/gabriel-ubuntu/edrom_2021/build" \
    "/usr/bin/python3" \
    "/home/gabriel-ubuntu/edrom_2021/src/vision/object_finder/setup.py" \
    egg_info --egg-base /home/gabriel-ubuntu/edrom_2021/build/vision/object_finder \
    build --build-base "/home/gabriel-ubuntu/edrom_2021/build/vision/object_finder" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/gabriel-ubuntu/edrom_2021/install" --install-scripts="/home/gabriel-ubuntu/edrom_2021/install/bin"
