import shutil

def copy_generated_files(*args, **kwargs):
    shutil.copy("docs/generated/available-plugins.md", "docs/plugins/available-plugins.md")
    shutil.copy("docs/generated/actions.md", "docs/actions.md")
    shutil.rmtree("docs/actions")
    shutil.copytree("docs/generated/actions", "docs/actions")

if __name__ == "__main__":
    copy_generated_files()
