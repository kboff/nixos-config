import vapoursynth as vs

core = vs.core

clip = core.std.BlankClip(
    length=100,
    width=1920,
    height=1080
)

clip.set_output()
