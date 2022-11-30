const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#2e2e2e", /* black   */
  [1] = "#f706cf", /* red     */
  [2] = "#15c3e9", /* green   */
  [3] = "#b676b1", /* yellow  */
  [4] = "#955ae7", /* blue    */
  [5] = "#4ee2ec", /* magenta */
  [6] = "#7c4dff", /* cyan    */
  [7] = "#fccdf5", /* white   */

  /* 8 bright colors */
  [8]  = "#6200ea",  /* black   */
  [9]  = "#2a9292",  /* red     */
  [10] = "#00bcd4", /* green   */
  [11] = "#536dfe", /* yellow  */
  [12] = "#105f9c", /* blue    */
  [13] = "#00838f", /* magenta */
  [14] = "#ff3864", /* cyan    */
  [15] = "#e4cdfc", /* white   */

  /* special colors */
  [256] = "#08011a", /* background */
  [257] = "#f5f5f5", /* foreground */
  [258] = "#15c3e9",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
