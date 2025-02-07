#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��broot.sh �VmK�P��_q��AkE�`c�A�C�L�kL���82�,(�t�L┡0���'���MZ��7��%����s��ܗ���W4>/X2c"�/5ԕ�v����ϫj�`��
��0�9���$�:����l��֡l�S0�(�n:|��^��st|IVlD�?��M$H���`���$e�N�nU$�u`?�͇�懹d�M��O������,~�;<��x�I����D�i����+;��^�51'�\��3:m�\l���j���i\�1{�g���������k��ٵ��u��j��d�D�$Wx�����R%��s�R7�>5zѕhQ�����V�v+�[v��?k�; G+ߐ�"?666Q`����
�t�+��:���1[�n��X�;�y�������t�D�J�̄����� xz�9x�u��]u�����'��t��0������,G�S���`�&��yC����-Y�0�~^B��*t��gQ��i��#nI�0վ�a@fQ�_��B/(Z=ʒ�W� �ڨRa�'�uSz��2�lElEO�RFK�ր�����P���	�3�=���Ι������6��BQ)
�dڌ�&�����Y�r�w�a��B>e��ۆŚ�����O �/�����R� y�:� �9����IX�`ڍ��v�����Εk�_��_w��	����V�h
�!�B�.S-D^����o�Wܙ���;���^�mo^ͻ�85�=����٥f"ou߫�?���o��aT	%���e����OG�x�k��7�*y�"��Q�2���?E��D
  