{ lib,...}:

{
services.udisks2 = {
  enable = true;

  settings = {
    "mount_options.conf" = {
      defaults = {
        # New Linux kernel NTFS driver by Namjae Jeon
        "ntfs:ntfs_defaults" =
          "uid=$UID,gid=$GID,windows_names";

        "ntfs:ntfs_allow" =
          "uid=$UID,gid=$GID,umask,dmask,fmask,iocharset,nls,showmeta,show_sys_files,case_sensitive,nocase,disable_sparse,errors,mft_zone_multiplier,preallocated_size,acl,sys_immutable,nohidden,hide_dot_files,windows_names,discard,native_symlink,symlink";

        # Force UDisks to prefer/use the new kernel ntfs driver
        "ntfs_drivers" = "ntfs";
      };
    };
  };
};
}
