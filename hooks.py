import os
import shutil

def copy_generated_files(*args, **kwargs):
    shutil.copy("docs/generated/available-plugins.md", "docs/plugins/available-plugins.md")
    shutil.copy("docs/generated/actions.md", "docs/actions.md")
    
    actions_dir="docs/actions"
    if os.path.isdir(actions_dir):
        shutil.rmtree(actions_dir)
    shutil.copytree("docs/generated/actions", actions_dir)

if __name__ == "__main__":
    copy_generated_files()
