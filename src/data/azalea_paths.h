
static const struct Vec2U16 sp0_path0[] = {
    {3, 31},
    {3, 29},
    {9, 29},
    {9, 27},
    {15, 28},
    {15, 25},
    {9, 25},
    {9, 24},
};

static const struct Vec2U16 sp1_path0[] = {
    {9, 31},
    {9, 29},
    {3, 29},
    {3, 27},
    {9, 26},
    {9, 25},
    {15, 25},
    {15, 24},
};

static const struct Vec2U16 sp2_path0[] = {
    {15, 31},
    {15, 28},
    {9, 27},
    {9, 26},
    {3, 27},
    {3, 24},
};

static const struct Vec2U16 sp6_path1[] = {
    {3, 16},
    {3, 12},
    {9, 13},
    {9, 10},
    {3, 10},
    {3, 9},
};

static const struct Vec2U16 sp6_path3[] = {
    {3, 16},
    {3, 12},
    {9, 13},
    {9, 9},
};

static const struct Vec2U16 sp7_path0[] = {
    {9, 16},
    {9, 14},
    {15, 14},
    {15, 11},
    {9, 12},
    {9, 10},
    {3, 10},
    {3, 9},
};

static const struct Vec2U16 sp7_path1[] = {
    {9, 16},
    {9, 14},
    {15, 14},
    {15, 9},
};

static const struct Vec2U16 sp7_path2[] = {
    {9, 16},
    {9, 14},
    {15, 14},
    {15, 11},
    {9, 12},
    {9, 9},
};

static const struct SpinarakPathSpec startingPoint7[] = {
    { NELEMS(sp7_path0), 9, sp7_path0 },
    { NELEMS(sp7_path1), 11, sp7_path1 },
    { NELEMS(sp7_path2), 10, sp7_path2 },
    { NELEMS(sp7_path1), 11, sp7_path1 },
};

static const struct SpinarakPathSpec startingPoint0[] = {
    { NELEMS(sp0_path0), 4, sp0_path0 },
    { NELEMS(sp0_path0), 4, sp0_path0 },
    { NELEMS(sp0_path0), 4, sp0_path0 },
    { NELEMS(sp0_path0), 4, sp0_path0 },
};

static const struct SpinarakPathSpec startingPoint1[] = {
    { NELEMS(sp1_path0), 5, sp1_path0 },
    { NELEMS(sp1_path0), 5, sp1_path0 },
    { NELEMS(sp1_path0), 5, sp1_path0 },
    { NELEMS(sp1_path0), 5, sp1_path0 },
};

static const struct SpinarakPathSpec startingPoint2[] = {
    { NELEMS(sp2_path0), 3, sp2_path0 },
    { NELEMS(sp2_path0), 3, sp2_path0 },
    { NELEMS(sp2_path0), 3, sp2_path0 },
    { NELEMS(sp2_path0), 3, sp2_path0 },
};

static const struct SpinarakPathSpec startingPoint3[] = {
    { NELEMS(sp2_path0), 2, sp2_path0 },
    { NELEMS(sp2_path0), 2, sp2_path0 },
    { NELEMS(sp2_path0), 2, sp2_path0 },
    { NELEMS(sp2_path0), 2, sp2_path0 },
};

static const struct SpinarakPathSpec startingPoint4[] = {
    { NELEMS(sp0_path0), 0, sp0_path0 },
    { NELEMS(sp0_path0), 0, sp0_path0 },
    { NELEMS(sp0_path0), 0, sp0_path0 },
    { NELEMS(sp0_path0), 0, sp0_path0 },
};

static const struct SpinarakPathSpec startingPoint5[] = {
    { NELEMS(sp1_path0), 1, sp1_path0 },
    { NELEMS(sp1_path0), 1, sp1_path0 },
    { NELEMS(sp1_path0), 1, sp1_path0 },
    { NELEMS(sp1_path0), 1, sp1_path0 },
};

static const struct SpinarakPathSpec startingPoint6[] = {
    {},
    { NELEMS(sp6_path1), 9, sp6_path1 },
    {},
    { NELEMS(sp6_path3), 10, sp6_path3 },
};

static const struct SpinarakPathSpec startingPoint11[] = {
    {},
    { NELEMS(sp7_path1), 7, sp7_path1 },
    {},
    { NELEMS(sp7_path1), 7, sp7_path1 },
};

static const struct SpinarakPathSpec startingPoint8[] = {
    {},
    {},
    {},
    {},
};

static const struct SpinarakPathSpec startingPoint9[] = {
    { NELEMS(sp7_path0), 7, sp7_path0 },
    { NELEMS(sp6_path1), 6, sp6_path1 },
    {},
    {},
};

static const struct SpinarakPathSpec startingPoint10[] = {
    {},
    {},
    { NELEMS(sp7_path2), 7, sp7_path2 },
    { NELEMS(sp6_path3), 6, sp6_path3 },
};
