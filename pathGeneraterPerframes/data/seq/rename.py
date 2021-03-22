import glob
import os
import sys



files = glob.glob("*.png")

output_file_name = input("Decide Output File name--->  ")
print("OK file name is"+output_file_name)
for i, old_name in enumerate(files):
    # ファイル名の決定
    new_name = "%s_{0:04d}.png".format(i + 1)%(output_file_name)
    # ファイル名の変更
    os.rename(old_name, new_name)
    # 変更の表示
    print(old_name + " → " + new_name)
