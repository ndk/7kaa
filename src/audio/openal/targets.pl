my @defines;

## compiler flags ##
@defines = qw( AMPLUS USE_OPENAL );
if (defined($video_backend)) {
  if ($video_backend =~ /sdl/i) {
    push (@defines, 'USE_SDL');
  } elsif ($video_backend =~ /ddraw/i) {
    push (@defines, 'USE_DDRAW');
  } elsif ($video_backend =~ /none/i) {
    push (@defines, 'USE_NOVIDEO');
  }
}
if (defined($debug) && $debug) {
  push (@defines, "DEBUG");
}
## end compiler flags ##

## include paths ##
my @includes = qw( ../../../include );

if (defined($wine_prefix)) {
  push (@includes, "$wine_prefix/include/wine/windows",
                   "$wine_prefix/include/wine/msvcrt");
}
## end include paths ##

my @targets = qw(
openal_audio.cpp
wav_stream.cpp
);

build_targets(\@targets, \@includes, \@defines);