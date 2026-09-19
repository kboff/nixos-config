import vapoursynth as vs
from vapoursynth import core
import k7sfunc as k7f  

# 源视频
clip = video_in

# 用户配置区：想用哪个就把前面的 '#' 删掉，并调整强度值
# 注意：同类型的滤镜只能同时启用一种

# 强力降噪：FFT3D，适合噪点严重的视频
#clip = k7f.FFT3D_STD(clip, sigma=2.5) # 强度建议：0.5 - 5.0

# 保留细节：NLM，适合追求画质的电影
# clip = k7f.NLM_STD(clip, strength=1.0) # 强度建议：0.5 - 2.0

# 去除胶片颗粒：DFTT
clip = k7f.DFTT_STD(clip, sigma=3.0) # 强度建议：1.0 - 5.0

# 去除蚊噪/压缩瑕疵：CCD
# clip = k7f.CCD_STD(clip, strength=6.0) # 强度建议：1 - 10

# 输出处理后的画面
clip.set_output()
