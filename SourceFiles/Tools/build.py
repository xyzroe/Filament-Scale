#!/usr/bin/env python3
Import("env")
import shutil
import os

def after_build(source, target, env):

    if not os.path.exists('bin'):
        os.makedirs('bin')

    firmware_folder = env.subst("$BUILD_DIR").split('/').pop()

    new_file_name = 'bin/'+firmware_folder+'.bin'
    shutil.move(firmware_source, new_file_name)
    
    print('')
    print('--------------------------------------------------------')
    print('{} created'.format(str(new_file_name)))
    print('--------------------------------------------------------')
    print('')

env.AddPostAction("buildprog", after_build)

firmware_source = os.path.join(env.subst("$BUILD_DIR"), "firmware.bin")