#ifndef API_DEFINE_MAYBE
#define API_DEFINE_MAYBE

template<typename T>
struct Maybe {
    T *data;
    bool just;
};

#endif
