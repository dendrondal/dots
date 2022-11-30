static const char norm_fg[] = "#e4cdfc";
static const char norm_bg[] = "#2e2e2e";
static const char norm_border[] = "#6200ea";

static const char sel_fg[] = "#e4cdfc";
static const char sel_bg[] = "#15c3e9";
static const char sel_border[] = "#e4cdfc";

static const char urg_fg[] = "#e4cdfc";
static const char urg_bg[] = "#f706cf";
static const char urg_border[] = "#f706cf";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
