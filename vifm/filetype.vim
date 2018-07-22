" Pdf
filextype *.pdf mupdf %c &
fileviewer *.pdf pdftotext -nopgbrk %c -

" Audio
filetype *.wav,*.mp3,*.flac,*.m4a,*.wma,*.ape,*.ac3,*.og[agx],*.spx,*.opus
       \ {Play using ffplay}
       \ ffplay -nodisp %c,
       \ {Play using MPlayer}
       \ mplayer %f,
fileviewer *.mp3 mp3info
fileviewer *.flac soxi

" Video
filextype *.avi,*.mp4,*.wmv,*.dat,*.3gp,*.ogv,*.mkv,*.mpg,*.mpeg,*.vob,
        \*.fl[icv],*.m2v,*.mov,*.webm,*.ts,*.mts,*.m4v,*.r[am],*.qt,*.divx,
        \*.as[fx]
        \ {View using mplayer}
        \ mplayer %f,
fileviewer *.avi,*.mp4,*.wmv,*.dat,*.3gp,*.ogv,*.mkv,*.mpg,*.mpeg,*.vob,
        \*.fl[icv],*.m2v,*.mov,*.webm,*.ts,*.mts,*.m4v,*.r[am],*.qt,*.divx,
        \*.as[fx]
        \ ffprobe -pretty %c 2>&1

" Web
filextype *.html,*.htm
        \ chromium %f &,
filetype *.html,*.htm links, lynx

" Object
filetype *.o nm %f | less

" Man page
filetype *.[1-8] man ./%c
fileviewer *.[1-8] man ./%c | col -b

" Images
filextype *.bmp,*.jpg,*.jpeg,*.png,*.gif,*.xpm
        \ {View in sxiv}
        \ sxiv %f,
        \ {View in gpicview}
        \ gpicview %c,
        \ {View in shotwell}
        \ shotwell,
fileviewer *.bmp,*.jpg,*.jpeg,*.png,*.gif,*.xpm
         \ convert -identify %f -verbose /dev/null


" MD5
filetype *.md5
       \ {Check MD5 hash sum}
       \ md5sum -c %f %S,

" SHA1
filetype *.sha1
       \ {Check SHA1 hash sum}
       \ sha1sum -c %f %S,

" SHA256
filetype *.sha256
       \ {Check SHA256 hash sum}
       \ sha256sum -c %f %S,

" SHA512
filetype *.sha512
       \ {Check SHA512 hash sum}
       \ sha512sum -c %f %S,

" GPG signature
filetype *.asc
       \ {Check signature}
       \ !!gpg --verify %c,

" Torrent
filetype *.torrent transmission-cli %f &
fileviewer *.torrent dumptorrent -v %c

" FuseZipMount
filetype *.zip,*.jar,*.war,*.ear,*.oxt,*.apkg
       \ {Mount with fuse-zip}
       \ FUSE_MOUNT|fuse-zip %SOURCE_FILE %DESTINATION_DIR,
       \ {View contents}
       \ zip -sf %c | less,
       \ {Extract here}
       \ tar -xf %c,
fileviewer *.zip,*.jar,*.war,*.ear,*.oxt zip -sf %c

" ArchiveMount
filetype *.tar,*.tar.bz2,*.tbz2,*.tgz,*.tar.gz,*.tar.xz,*.txz
       \ {Mount with archivemount}
       \ FUSE_MOUNT|archivemount %SOURCE_FILE %DESTINATION_DIR,
fileviewer *.tgz,*.tar.gz tar -tzf %c
fileviewer *.tar.bz2,*.tbz2 tar -tjf %c
fileviewer *.tar.txz,*.txz xz --list %c
fileviewer *.tar tar -tf %c

" Rar2FsMount and rar archives
filetype *.rar
       \ {Mount with rar2fs}
       \ FUSE_MOUNT|rar2fs %SOURCE_FILE %DESTINATION_DIR,
fileviewer *.rar unrar v %c

" IsoMount
filetype *.iso
       \ {Mount with fuseiso}
       \ FUSE_MOUNT|fuseiso %SOURCE_FILE %DESTINATION_DIR,

" Fuse7z and 7z archives
filetype *.7z
       \ {Mount with fuse-7z}
       \ FUSE_MOUNT|fuse-7z %SOURCE_FILE %DESTINATION_DIR,
fileviewer *.7z 7z l %c

" Office files
filextype *.odt,*.doc,*.docx,*.xls,*.xlsx,*.odp,*.pptx libreoffice %f &
fileviewer *.doc catdoc %c
fileviewer *.docx, docx2txt.pl %f -
