#!/usr/bin/env python3
from subprocess import call
Import("env")
import shutil
import os
from glob import glob

def after_build(source, target, env):

    firmware_folder = env.subst("$BUILD_DIR").split('/').pop()
    #print(firmware_folder)
    NEW_NAME = 'bin/'+firmware_folder+'.bin'
    shutil.move(firmware_source, NEW_NAME)
    
    
    #for f in glob ('bin/*.bin'):
    #    os.unlink (f)

    print('')
    print('--------------------------------------------------------')
    print('{} created with success !'.format(str(NEW_NAME)))
    print('--------------------------------------------------------')
    print('')

env.AddPostAction("buildprog", after_build)

firmware_source = os.path.join(env.subst("$BUILD_DIR"), "firmware.bin")