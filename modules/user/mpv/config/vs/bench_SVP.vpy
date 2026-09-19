import vapoursynth as vs
from vapoursynth import core  # svpflow1/2 在 /usr/lib/vapoursynth 已自动加载

G = int(__import__("sys").argv[1]) if len(__import__("sys").argv) > 1 else 1  # 命令行传 1=GPU 0=CPU

clip = core.std.BlankClip(length=300, width=1920, height=1080,
                          format=vs.YUV420P8, fpsnum=24000, fpsden=1001)
super_params = "{pel:1,gpu:%d,scale:{up:0,down:0},full:false,rc:true}" % G
analyse_params = "{gpu:%d,block:{overlap:0},main:{search:{type:2}}}" % G
smoothfps_params = "{rate:{num:4,den:1,abs:false},algo:13,gpuid:0,scene:{},mask:{area:75,cover:75}}"
super = core.svp1.Super(clip, super_params)
vectors = core.svp1.Analyse(super["clip"], super["data"], clip, analyse_params)
out = core.svp2.SmoothFps(clip, super["clip"], super["data"],
                          vectors["clip"], vectors["data"], smoothfps_params, src=clip)
out.set_output()
